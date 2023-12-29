import 'dart:developer';

import 'package:deelly/controllers/auth_controller.dart';
import 'package:deelly/utils/widgets/app_button.dart';
import 'package:deelly/utils/widgets/custom_text_field.dart';
import 'package:deelly/utils/widgets/phone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/styles.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  AuthController authController = Get.find(tag: "authController");
  final signupKey = GlobalKey<FormState>();

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
                      "Sign Up",
                      style: Styles.heading,
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Image.asset(
                  "assets/images/app-logo.png",
                  scale: 8,
                ),
                SizedBox(
                  height: Get.height * 0.08,
                ),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Form(
                    key: signupKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: authController.firstNameController,
                          title: "First Name",
                          hintText: "First Name",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter First Name";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomTextField(
                          controller: authController.lastNameController,
                          title: "Last Name",
                          hintText: "Last Name",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Last Name";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomTextField(
                          controller: authController.emailController,
                          title: "Email",
                          hintText: "Email",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Email";
                            } else if (!value.isEmail) {
                              return "Please enter valid email";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        PhoneField(
                            controller:
                                authController.phoneNumberController,
                            onCountryChanged: (value) {
                              authController.signupPhoneCode =
                                  value.dialCode.toString();
                              log("Dial Code: ${authController.signupPhoneCode}");
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
                          height: 16.h,
                        ),
                        CustomTextField(
                          controller: authController.createPasswordController,
                          title: "Create Password",
                          hintText: "Create Password",
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
                        CustomTextField(
                          controller: authController.confirmPasswordController,
                          title: "Confirm Password",
                          hintText: "Confirm Password",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter password";
                            } else if (value.toString().length < 8) {
                              return "Password must be 8 characters long";
                            } else if (value.toString() !=
                                authController.confirmPasswordController.text
                                    .toString()) {
                              return "Password didn\'t match";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: Styles.body,
                            ),
                            SizedBox(
                              width: 04.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Text(
                                "Login",
                                style: Styles.body.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Obx(
                          () => authController.isUserSigningUp.value
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ),
                                )
                              : AppButton(
                                  title: "Sign Up",
                                  onTap: () {
                                    if (signupKey.currentState!.validate()) {
                                      log("Form Validated");
                                      authController.signup(
                                          firstName: authController.firstNameController.text,
                                          lastName: authController.lastNameController.text,
                                          email: authController.emailController.text,
                                          countryCode: authController.signupPhoneCode,
                                          phoneNumber: authController.phoneNumberController.text,
                                          city: authController.city,
                                          country: authController.country,
                                          password: authController.createPasswordController.text,
                                          confirmPassword: authController.confirmPasswordController.text,
                                          fcmToken: authController.fcmToken);
                                    } else {
                                      log("Form not validated");
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
