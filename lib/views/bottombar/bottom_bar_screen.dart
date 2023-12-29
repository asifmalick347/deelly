
import 'package:deelly/constants/app_colors.dart';
import 'package:deelly/constants/styles.dart';
import 'package:deelly/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: index == 0
                  ?   HomeScreen()
                  : index == 1
                  ?  const Center(child: Text("Coming Soon"))
                  : index == 2
                  ? const Center(child: Text("Coming Soon"))
                  : const Center(child: Text("Coming Soon"))
          ),
          Stack(
            children: [
              Container(
                height: 80,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: const Offset(0,1),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child:index == 0
                          ? Container(
                        height: 50,
                        width: Get.width * 0.3,
                        padding: EdgeInsets.symmetric(horizontal: 08.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: const LinearGradient(
                              colors: [AppColors.primaryColor, AppColors.secondaryColor],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/Home.png", scale: 4,),
                            SizedBox(width: 04.w,),
                            Text("Home", style: Styles.bodySmall.copyWith(color: Colors.white, fontWeight: FontWeight.w700),),
                          ],
                        ),
                      ) : Image.asset("assets/icons/home-disabled.png", scale: 4,),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child:index == 1
                          ? Container(
                        height: 50,
                        width: Get.width * 0.3,
                        padding: EdgeInsets.symmetric(horizontal: 08.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: const LinearGradient(
                            colors: [AppColors.primaryColor, AppColors.secondaryColor],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/Category.png", scale: 4,),
                            SizedBox(width: 04.w,),
                            Text("Categories", style: Styles.bodySmall.copyWith(color: Colors.white, fontWeight: FontWeight.w700),),
                          ],
                        ),
                      ) : Image.asset("assets/icons/category-disabled.png", scale: 4,),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child:index == 2
                          ? Container(
                        height: 50,
                        width: Get.width * 0.3,
                        padding: EdgeInsets.symmetric(horizontal: 08.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: const LinearGradient(
                            colors: [AppColors.primaryColor, AppColors.secondaryColor],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/Location.png", scale: 4,),
                            SizedBox(width: 04.w,),
                            Text("Location", style: Styles.bodySmall.copyWith(color: Colors.white, fontWeight: FontWeight.w700),),
                          ],
                        ),
                      ) : Image.asset("assets/icons/Location-disabled.png", scale: 4,),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 3;
                        });
                      },
                      child:index == 3
                          ? Container(
                        height: 50,
                        width: Get.width * 0.3,
                        padding: EdgeInsets.symmetric(horizontal: 08.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: const LinearGradient(
                            colors: [AppColors.primaryColor, AppColors.secondaryColor],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/Profile.png", scale: 4,),
                            SizedBox(width: 04.w,),
                            Text("Profile", style: Styles.bodySmall.copyWith(color: Colors.white, fontWeight: FontWeight.w700),),
                          ],
                        ),
                      ) : Image.asset("assets/icons/Profile-disbaled.png", scale: 4,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
