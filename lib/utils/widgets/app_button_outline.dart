import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/styles.dart';

class AppButtonOutline extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const AppButtonOutline({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
                    width: Get.width,
                    height: 50.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(child: Text(title, style: Styles.body.copyWith(fontWeight: FontWeight.w500),)),
                  ),
    );
  }
}