import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart'; // Sanani formatlash uchun kerak: flutter pub add intl
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/widget/button_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  String? selectedGender;

  // Sanani tanlash funksiyasi
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
        dobController.text = DateFormat('yyyy/MM/dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Inputlar uchun umumiy dekoratsiya stili
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

                  // Full Name
                  _buildLabel("Full Name"),
                  Gap(8.h),
                  TextField(
                    controller: nameController,
                    style: AppStyles.textStyle14Medium(AppColors.textColor),
                    decoration: inputDecoration("Pedro Duarte"),
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
            onTap: () {
              // Keyingi sahifaga o'tish mantiqi
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