import 'dart:developer';

import 'package:deelly/controllers/auth_controller.dart';
import 'package:deelly/utils/utils.dart';
import 'package:deelly/utils/widgets/app_button.dart';
import 'package:deelly/utils/widgets/custom_text_field.dart';
import 'package:deelly/utils/widgets/phone_field.dart';
import 'package:deelly/views/auth/signup_screen.dart';
import 'package:deelly/views/bottombar/bottom_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/styles.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  AuthController authController = Get.find(tag: "authController");
  final loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 08.h, horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Text(
                      "Sign In",
                      style: Styles.heading,
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.1,
                ),
                Image.asset(
                  "assets/images/app-logo.png",
                  scale: 6,
                ),
                SizedBox(
                  height: Get.height * 0.1,
                ),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Form(
                    key: loginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PhoneField(
                            controller: authController.loginPhoneController,
                            onCountryChanged: (value) {
                              authController.loginPhoneCode =
                                  value.dialCode.toString();
                              log("Dial Code: ${authController.loginPhoneCode}");
                            },
                            onChanged: (value) {},
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter phone number";
                              } else if (!value.toString().isPhoneNumber) {
                                return "Please enter valid phone number";
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 32.h,
                        ),
                        CustomTextField(
                          controller: authController.loginPasswordController,
                          title: "Password",
                          hintText: "Password",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter password";
                            } else if (value.toString().length < 8) {
                              return "Password must be 8 characters long";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password?",
                              style: Styles.bodySmall
                                  .copyWith(color: const Color(0xff56B3EB)),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 18,
                              child: Obx(
                                () => Checkbox(
                                  value: authController
                                      .isPrivacyPolicyChecked.value,
                                  side: const BorderSide(width: 0.7),
                                  splashRadius: 0,
                                  activeColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(04),
                                      side: BorderSide(width: 0.5)),
                                  onChanged: (bool? value) {
                                    authController
                                        .isPrivacyPolicyChecked.value = value!;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 08.w,
                            ),
                            Text(
                              "I agree with the terms and condition",
                              style: Styles.bodySmall.copyWith(
                                  color: Colors.black.withOpacity(0.5)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 08.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don\'t have an account?",
                              style: Styles.body,
                            ),
                            SizedBox(
                              width: 04.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => SignupScreen());
                              },
                              child: Text(
                                "Signup",
                                style: Styles.body.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Obx(
                          () => authController.isUserSigningIn.value
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ),
                                )
                              : AppButton(
                                  title: "Log In",
                                  onTap: () {
                                    if (loginKey.currentState!.validate()) {
                                      if (authController
                                          .isPrivacyPolicyChecked.value) {
                                        authController.login(
                                            phoneNumber: authController.loginPhoneController.text,
                                            password: authController.loginPasswordController.text,
                                            fcmToken: authController.fcmToken);
                                      } else {
                                        Utils.customToast(
                                            message:
                                                "Please check terms and conditions");
                                      }
                                    }
                                  }),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
