import 'package:deelly/constants/app_colors.dart';
import 'package:deelly/constants/styles.dart';
import 'package:deelly/controllers/home_controller.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeController homeController =
      Get.put(HomeController(), tag: "homeController");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor.withOpacity(0.4),
              AppColors.bgLightColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.22,
              width: Get.width,
              child: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "UAE",
                                style: Styles.body,
                              ),
                              const Icon(
                                Icons.expand_more,
                                size: 18,
                              ),
                            ],
                          ),
                          Image.asset(
                            "assets/images/app-logo.png",
                            scale: 16,
                          ),
                          SizedBox(
                            width: 42,
                            height: 30,
                            child: Stack(
                              children: [
                                SizedBox(
                                    height: 40,
                                    child: Image.asset(
                                      "assets/icons/Buy.png",
                                      scale: 4,
                                    )),
                                Positioned(
                                  right: 0,
                                  top: -1,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    padding: const EdgeInsets.all(03),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: FittedBox(
                                        child: Text(
                                      "03",
                                      style: Styles.bodySmall.copyWith(
                                          fontSize: 10.sp, color: Colors.white),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 44.h,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: Image.asset(
                                    "assets/icons/search.png",
                                    scale: 5,
                                  ),
                                  hintText: "Search...",
                                  hintStyle: Styles.body.copyWith(
                                      color: const Color(0xff717171),
                                      fontWeight: FontWeight.w500),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xffE4E6ED),
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xffE4E6ED),
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xffE4E6ED),
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Image.asset("assets/icons/filter.png"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: Get.width,
                padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Filter By Category",
                        style: Styles.subHeading,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          categoryFilterWidget(
                            title: "Dinning",
                            color: AppColors.bgLightColor,
                            imagePath: "assets/icons/Dinning 1.png",
                          ),
                          categoryFilterWidget(
                            title: "Saloon/Spa",
                            color: const Color(0xffF5E3DB),
                            imagePath: "assets/icons/image 82447.png",
                          ),
                          categoryFilterWidget(
                            title: "Entertainment",
                            color: const Color(0xffF5DCDC),
                            imagePath: "assets/icons/Group 1000006952.png",
                          ),
                          categoryFilterWidget(
                            title: "Cleaning",
                            color: const Color(0xffCFE9FE),
                            imagePath: "assets/icons/Group 1000006952.png",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      const Divider(
                        color: Color(0xffE9E9E9),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Filter By Discount",
                        style: Styles.subHeading,
                      ),
                      SizedBox(
                        height: 08.h,
                      ),
                      SizedBox(
                        width: Get.width,
                        height: 48,
                        child: ListView.builder(
                            itemCount: 10,
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 100.w,
                                height: 48.h,
                                margin: EdgeInsets.only(right: 08.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: const Color(0xff8AD4C4),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Up to 10%",
                                    style: Styles.body.copyWith(
                                        color: const Color(0xff628A79),
                                        fontSize: 16.sp),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Divider(
                        color: Color(0xffE9E9E9),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Upcoming Deals",
                        style: Styles.subHeading,
                      ),
                      SizedBox(
                        height: 08.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(7, (index) {
                          return Obx(
                            () => InkWell(
                              onTap: () {
                                homeController.selectedDeal.value = index;
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 08.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  color:
                                      homeController.selectedDeal.value == index
                                          ? const Color(0xffD5F4ED)
                                          : Colors.white,
                                  border: Border.all(
                                    color: const Color(0xff8AD4C4),
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "${index + 25}",
                                      style: Styles.subHeading.copyWith(
                                          color: homeController
                                                      .selectedDeal.value ==
                                                  index
                                              ? Colors.black
                                              : const Color(0xff628A79)),
                                    ),
                                    Text(
                                      "Nov",
                                      style: Styles.bodySmall.copyWith(
                                          color: homeController
                                                      .selectedDeal.value ==
                                                  index
                                              ? Colors.black
                                              : const Color(0xff628A79),
                                          fontSize: 10.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        height: 130.h,
                        child: PageView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: Get.width,
                              height: 150.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.r)),
                                  child: Image.asset(
                                    "assets/images/Group 1000006960.png",
                                  )),
                            );
                          },
                          onPageChanged: (newIndex) {
                            homeController.currentBannerIndex.value = newIndex;
                          },
                        ),
                      ),
                      Center(
                        child: Obx(
                          () => DotsIndicator(
                            dotsCount: 5,
                            position: homeController.currentBannerIndex.value,
                            decorator: DotsDecorator(
                              size: const Size.square(9.0),
                              activeSize: const Size(18.0, 9.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              colors: [
                                Colors.grey,
                                Colors.grey,
                                Colors.grey,
                                Colors.grey,
                                Colors.grey,
                              ], // Inactive dot colors
                              activeColors: [
                                AppColors.primaryColor,
                                AppColors.primaryColor,
                                AppColors.primaryColor,
                                AppColors.primaryColor,
                                AppColors.primaryColor
                              ], // Àctive dot colors
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Deal of the day",
                        style: Styles.subHeading,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 260.h,
                        width: Get.width,
                        child: ListView.builder(
                          itemCount: 5,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return Container(
                              width: 265.w,
                              margin: EdgeInsets.only(right: 12.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 265.w,
                                    height: 150.h,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(10.r), topLeft: Radius.circular(10.r),),
                                      image: const DecorationImage(
                                        image: AssetImage("assets/images/Rectangle 34624588.png"),
                                        fit: BoxFit.cover,
                                      )
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset("assets/icons/Frame 1000006276.png", scale: 5,),
                                          Image.asset("assets/icons/Group 1000006892.png", scale: 4,),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 08.h,),
                                  Text("Ristorante – Niko Romito", style: Styles.subHeading.copyWith(fontWeight: FontWeight.w500),),
                                  Text("Dine and enjoy a 20% Discount", style: Styles.body.copyWith(color: const Color(0xffA3A7AC)),),
                                  const Divider(
                                    color: Color(0xffECECEC),
                                    thickness: 2,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset("assets/icons/loc-icon.png", scale: 5,),
                                      SizedBox(width: 04.w,),
                                      Text("Ristorante L’Olivo at Al Mah... ", style: Styles.bodySmall.copyWith(color: const Color(0xffA4A7AC),),),
                                      Text("+5 more", style: Styles.bodySmall.copyWith(color: const Color(0xff59B99D),),),
                                    ],
                                  ),
                                  SizedBox(height: 08.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("5.0", style: Styles.bodySmall.copyWith(color: const Color(0xffA4A7AC),),),
                                          SizedBox(width: 04.w,),
                                          Image.asset("assets/icons/Frame 1000006942.png", scale: 5,),
                                          SizedBox(width: 04.w,),
                                          Text("(7 Reviews)", style: Styles.bodySmall.copyWith(color: const Color(0xffA4A7AC),),),
                                        ],
                                      ),
                                      Text("Sold: 7350", style: Styles.bodySmall.copyWith(color: const Color(0xffA4A7AC),),),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Our Partners",
                        style: Styles.subHeading,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 130,
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                            itemCount: 6,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1/0.5,
                              crossAxisSpacing: 16.w,
                              mainAxisSpacing: 16.h,
                            ),
                            itemBuilder: (context, index){
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: const Color(0xffDBDBDB)),
                              ),
                              child: Image.asset("assets/images/image 82455.png", scale: 5,),
                            );
                            },
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

  Widget categoryFilterWidget(
      {required String title,
      required String imagePath,
      required Color color}) {
    return Column(
      children: [
        Container(
          width: 70.w,
          height: 70.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Image.asset(
            imagePath,
            scale: 5,
          ),
        ),
        SizedBox(
          height: 08.h,
        ),
        Text(
          title,
          style: Styles.bodySmall,
        ),
      ],
    );
  }
}
