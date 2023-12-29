import 'package:deelly/constants/app_colors.dart';
import 'package:deelly/constants/styles.dart';
import 'package:deelly/controllers/auth_controller.dart';
import 'package:deelly/utils/widgets/app_button.dart';
import 'package:deelly/utils/widgets/app_button_outline.dart';
import 'package:deelly/views/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'views/auth/login_screen.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
   AuthController authController = Get.put(AuthController(), tag: "authController");

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          SizedBox(height: Get.height *0.4,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/app-logo.png", scale: 2,),
                SizedBox(height: 08.h,),
               Text("Welcome to deelly the world of deals", style: Styles.subHeading.copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp), textAlign: TextAlign.center,),
              ],
            ),
          ),
          const Spacer(),
          Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Expanded(
                child: AppButtonOutline(
                  title: "Sign In",
                  onTap: (){
                    Get.to(() => SignInScreen());
                  },
                ),
                ),
                SizedBox(width:24.w),
                Expanded(
                child: AppButton(title: "Sign Up", onTap: (){
                  Get.to(() => SignupScreen());
                }),
                ),
            ],
          ),
          ),
          SizedBox(height: 24.h,),

        ],
      ),
    );
  }
}