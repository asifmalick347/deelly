import 'dart:developer';

import 'package:deelly/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.35,
              decoration: const BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  image: AssetImage("assets/images/Rectangle 34624590.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 08.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.back();
                                log("Button Clicked!");
                              },
                              child: Image.asset(
                                "assets/icons/back-icon.png",
                                scale: 4,
                              )),
                          Image.asset(
                            "assets/icons/heart-icon.png",
                            scale: 4,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.12,
                      ),
                      Row(
                        children: [
                          stackImageWidget(),
                          stackImageWidget(),
                          stackImageWidget(),
                          stackImageWidget(),
                          moreImagesWidget(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: Get.height * 0.32,
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                  color: Colors.white
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 24.h,
                    left: 16.w,
                    right: 16.w,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/icons/30% off.png",
                            scale: 4,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/icons/Vector.png", scale: 5,),
                                  SizedBox(width: 08.w,),
                                  Text("Sold: ", style: Styles.body.copyWith(color: const Color(0xffA4A7AC)),),
                                  Text("564", style: Styles.body.copyWith(fontWeight: FontWeight.w700),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("5.0 ", style: Styles.bodySmall.copyWith(color: const Color(0xffA4A7AC)),),
                                  Image.asset("assets/icons/Star.png", scale: 5,),
                                  SizedBox(width: 08.w,),
                                  Text("(7 Reviews)",style: Styles.bodySmall.copyWith(color: const Color(0xffA4A7AC)),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 08.h,),
                      Text("Ristorante – Niko Romito", style: Styles.heading.copyWith(fontSize: 32.sp),),
                      SizedBox(height: 08.h,),
                      Row(
                        children: [
                          Image.asset("assets/icons/loc-icon.png", scale: 5,),
                          Text("Abu Dhabi, United Arab Emirates", style: Styles.body.copyWith(color: const Color(0xffA4A7AC)),),
                        ],
                      ),
                      SizedBox(height: 08.h,),
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: const Color(0xffEBFCF8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget stackImageWidget() {
    return Container(
      width: 60.w,
      height: 50.h,
      margin: EdgeInsets.only(right: 04.w),
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/icons/Rectangle 34624617.png"),
        fit: BoxFit.cover,
      )),
    );
  }

  Widget moreImagesWidget() {
    return Stack(
      children: [
        Container(
          width: 60.w,
          height: 50.h,
          margin: EdgeInsets.only(right: 04.w),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/icons/Rectangle 34624617.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 60.w,
          height: 50.h,
          margin: EdgeInsets.only(right: 04.w),
          decoration: const BoxDecoration(
            color: Colors.black54,
          ),
          child: Center(
            child: Text(
              "+5",
              style: Styles.body.copyWith(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}
