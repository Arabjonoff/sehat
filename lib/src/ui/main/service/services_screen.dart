import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/ui/main/service/detail/services_detail_screen.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  // Xizmatlar ro'yxati
  final List<Map<String, String>> services = [
    {"name": "Cardiology", "image": "assets/images/cardimage.png"},
    {"name": "Neurology", "image": "assets/images/cardimage.png"},
    {"name": "Dentist", "image": "assets/images/cardimage.png"},
    {"name": "Therapy", "image": "assets/images/cardimage.png"},
    {"name": "Surgeon", "image": "assets/images/cardimage.png"},
    {"name": "Pediatric", "image": "assets/images/cardimage.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          "Services",
          style: AppStyles.textStyle16Medium(AppColors.textColor),
        ),
      ),
      backgroundColor: AppColors.background,
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 12.h),
        itemCount: services.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Bir qatorda 2 ta card
          mainAxisSpacing: 10.h, // Vertikal masofa
          crossAxisSpacing: 10.w, // Gorizontal masofa
          mainAxisExtent: 115.h, // Cardning aniq balandligi
        ),
        itemBuilder: (context, index) {
          final service = services[index];
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder){
                return ServicesDetailScreen();
              }));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    service['name']!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textStyle16Medium(AppColors.textColor),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 48.r,
                        height: 48.r,
                        child: Image.asset(
                          service['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/arrow-right.svg",
                        width: 24.r,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}