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
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 24.h,
                    left: 16.w,
                    right: 16.w,
                  ),
                  child: SingleChildScrollView(
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
                                    Image.asset(
                                      "assets/icons/Vector.png",
                                      scale: 5,
                                    ),
                                    SizedBox(
                                      width: 08.w,
                                    ),
                                    Text(
                                      "Sold: ",
                                      style: Styles.body.copyWith(
                                          color: const Color(0xffA4A7AC)),
                                    ),
                                    Text(
                                      "564",
                                      style: Styles.body.copyWith(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "5.0 ",
                                      style: Styles.bodySmall.copyWith(
                                          color: const Color(0xffA4A7AC)),
                                    ),
                                    Image.asset(
                                      "assets/icons/Star.png",
                                      scale: 5,
                                    ),
                                    SizedBox(
                                      width: 08.w,
                                    ),
                                    Text(
                                      "(7 Reviews)",
                                      style: Styles.bodySmall.copyWith(
                                          color: const Color(0xffA4A7AC)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 08.h,
                        ),
                        Text(
                          "Ristorante – Niko Romito",
                          style: Styles.heading.copyWith(fontSize: 32.sp),
                        ),
                        SizedBox(
                          height: 08.h,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/icons/loc-icon.png",
                              scale: 5,
                            ),
                            Text(
                              "Abu Dhabi, United Arab Emirates",
                              style: Styles.body
                                  .copyWith(color: const Color(0xffA4A7AC)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                          width: Get.width,
                          padding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: const Color(0xffEBFCF8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Choose Location",
                                style: Styles.body.copyWith(
                                  color: const Color(0xff808080),
                                ),
                              ),
                              SizedBox(
                                height: 08.h,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Palm Jumeirah",
                                  hintStyle: Styles.subHeading.copyWith(
                                      fontSize: 16.sp,
                                      color: const Color(0xffB4B4B6),
                                      fontWeight: FontWeight.w400),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 12.h, horizontal: 16.w),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                      color: Color(0xffE8E8E8),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                      color: Color(0xffE8E8E8),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                      color: Color(0xffE8E8E8),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                      color: Color(0xffE8E8E8),
                                    ),
                                  ),
                                  suffixIcon: const Icon(
                                    Icons.expand_more,
                                    color: Color(0xffB4B4B6),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                "Select Date",
                                style: Styles.body.copyWith(
                                  color: const Color(0xff808080),
                                ),
                              ),
                              SizedBox(
                                height: 08.h,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "30 Dec 2023",
                                  hintStyle: Styles.subHeading.copyWith(
                                      fontSize: 16.sp,
                                      color: const Color(0xffB4B4B6),
                                      fontWeight: FontWeight.w400),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 12.h, horizontal: 16.w),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                      color: Color(0xffE8E8E8),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                      color: Color(0xffE8E8E8),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                      color: Color(0xffE8E8E8),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                      color: Color(0xffE8E8E8),
                                    ),
                                  ),
                                  suffixIcon: const Icon(
                                    Icons.calendar_month,
                                    color: Color(0xffB4B4B6),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                "Choose Time Slot",
                                style:
                                    Styles.subHeading.copyWith(fontSize: 14.sp),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 80.h,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffD6EFE9),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Text(
                                              "10 PM",
                                              style: Styles.body.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "Seat: 10",
                                              style: Styles.body.copyWith(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 80.h,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffD6EFE9),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 80.h,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffD6EFE9),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
