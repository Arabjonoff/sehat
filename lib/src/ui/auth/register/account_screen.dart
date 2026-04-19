import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart'; // Sanani formatlash uchun kerak: flutter pub add intl
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sehat/src/api_service/repository.dart';
import 'package:sehat/src/dialog/app_toast.dart';
import 'package:sehat/src/dialog/loading_dialog.dart';
import 'package:sehat/src/model/http_result.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/widget/button_widget.dart';
import 'package:sehat/utils/cacheservice.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  String? selectedGender;
  TextEditingController controllerPhone = TextEditingController();
  bool isFull = false;
  final Repository _repository = Repository();
  var maskFormatter = MaskTextInputFormatter(
    mask: '+998 ## ### ## ##',
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy,
  );

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: AppColors.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration inputDecoration(String hint) => InputDecoration(
      hintText: hint,
      hintStyle: AppStyles.textStyle16Regular(AppColors.subTextColorGray.withOpacity(0.5)),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.r),
        borderSide: const BorderSide(color: Color(0xffE2E8F0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.r),
        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.r),
      ),
    );

    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.background, elevation: 0),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Complete your profile", style: AppStyles.textStyle18Medium(AppColors.textColor)),
                  Gap(4.h),
                  Text(
                    "This information helps us personalize your experience and ensure better care",
                    style: AppStyles.textStyle16Regular(AppColors.subTextColorGray),
                  ),
                  Gap(24.h),
                  _buildLabel("Full Name"),
                  Gap(8.h),
                  TextField(
                    controller: nameController,
                    style: AppStyles.textStyle14Medium(AppColors.textColor),
                    decoration: inputDecoration("Pedro Duarte"),
                  ),
                  Gap(8.h),
                  _buildLabel("Phone"),
                  Gap(8.h),
                  TextField(
                    controller: controllerPhone,
                    inputFormatters: [maskFormatter], // 3. Maskani ulash
                    keyboardType: TextInputType.phone,
                    onChanged: (val) {
                      setState(() {
                        isFull = val.length == 17;
                      });
                    },
                    style: AppStyles.textStyle14Medium(AppColors.textColor),
                    decoration: InputDecoration(
                      hintText: "+998 _ _  _ _ _  _ _  _ _",
                      hintStyle: AppStyles.textStyle16Regular(AppColors.subTextColorGray.withOpacity(0.5)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(color: Color(0xffE2E8F0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                      ),
                    ),
                  ),
                  Gap(16.h),

                  // Gender Dropdown
                  _buildLabel("Gender"),
                  Gap(8.h),
                  DropdownButtonFormField<String>(
                    dropdownColor: AppColors.white,
                    value: selectedGender,
                    icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.subTextColorGray),
                    style: AppStyles.textStyle14Medium(AppColors.textColor),
                    decoration: inputDecoration("Sex"),
                    items: ["Male", "Female",].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedGender = newValue;
                      });
                    },
                  ),
                  Gap(16.h),

                  // Date of Birth
                  _buildLabel("Date of Birth"),
                  Gap(8.h),
                  TextField(
                    controller: dobController,
                    readOnly: true, // Klaviatura chiqmaydi
                    onTap: () => _selectDate(context), // Bosilganda kalendar chiqadi
                    style: AppStyles.textStyle14Medium(AppColors.textColor),
                    decoration: inputDecoration("yyyy/mm/dd").copyWith(
                      suffixIcon: const Icon(Icons.calendar_month_outlined, color: AppColors.subTextColorGray),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ButtonWidget(
            text: "Continue",
            isActive: nameController.text.isNotEmpty && selectedGender != null && dobController.text.isNotEmpty,
            onTap: () async{
              LoadingDialog.show(context);
              String fullNumber = maskFormatter.getUnmaskedText();
              Map data = {
                "fullname": nameController.text,
                "phone": "+998$fullNumber",
                "gender": selectedGender.toString().toLowerCase(),
                "birth_date": dobController.text,
              };
              HttpResult res = await _repository.register(data);
              if(res.status>=200&&res.status<299){
                LoadingDialog.hide(context);
                CacheService.savePhone(controllerPhone.text);
                CacheService.saveBirthDate(nameController.text);
                CacheService.saveFirstName(selectedGender!);
                context.go("/verification?phone=+998$fullNumber&isRegister=true");
              }else{
                LoadingDialog.hide(context);
                AppToast.error(context: context, description: res.result['phone']??["code"].toString());
              }
            },
          ),
          Gap(34.h)
        ],
      ),
    );
  }
  Widget _buildLabel(String text) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(text: text, style: AppStyles.textStyle14Medium(AppColors.textColor)),
        TextSpan(text: " *", style: AppStyles.textStyle14Medium(AppColors.red)),
      ]),
    );
  }
}