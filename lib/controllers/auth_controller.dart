import 'dart:developer';

import 'package:deelly/models/signup_model.dart';
import 'package:deelly/services/api_services.dart';
import 'package:deelly/utils/utils.dart';
import 'package:deelly/views/auth/login_screen.dart';
import 'package:deelly/views/bottombar/bottom_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_model.dart';

class AuthController extends GetxController{
  SignupModel? signupModel;
  LoginModel? loginModel;
  RxBool isUserSigningUp = false.obs;
  RxBool isUserSigningIn = false.obs;

  // LOGIN VARIABLES
  RxBool isPrivacyPolicyChecked = false.obs;
  String loginPhoneCode = "+92";
  final TextEditingController loginPhoneController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  // SIGNUP VARIABLES
  String signupPhoneCode = "+92";
  String city = "";
  String country = "";
  String fcmToken = "hshgss7ssbsbshs89w82hnjjubb";
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController createPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
  }



  //CHECK LOCATION PERMISSIONS
  Future<Position> determinePosition() async {
    log('Fetching current location');
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }


 //GET LOCATION
  getLocation() async {
    await determinePosition().then((location) {
      log("Latitude: ${location.latitude}");
      log("Longitude: ${location.longitude}");
      findUserAddress(lat: location.latitude, lng: location.longitude);
    });
  }


  // CONVERT LOCATION INTO ADDRESS
  findUserAddress({var lat, var lng}) async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lng);
    if (placeMarks.isNotEmpty) {
      Placemark place = placeMarks[0];
      city = place.locality ?? 'Unknown';
      log("City : $city");
      country = place.country ?? 'Unknown';
      log("Country : $country");
    }
  }


// GET the FCM TOKEN
//   Future<void> getToken() async {
//     String? token = await _firebaseMessaging.getToken();
//     log("FCM Token: $token");
//   }

// SIGNUP
 signup({
    required String firstName,
   required String lastName,
   required String email,
   required String countryCode,
   required String phoneNumber,
   required String city,
   required String country,
   required String password,
   required String confirmPassword,
   required String fcmToken,
})async{
   isUserSigningUp.value = true;
    const endPoint = "/shipper/register";
    final header = {
      "Accept" : "application/json"
    };
    final body = {
      "first_name": firstName,
      "last_name": lastName,
      "code": countryCode,
      "email": email,
      "mobile_number": phoneNumber,
      "city": city,
      "country": country,
      "password": password,
      "password_confirmation": confirmPassword,
      "fcm_token": fcmToken
    };

    final response = await ApiServices.postApi(endPoint: endPoint, header: header, body: body);
    if(response.statusCode == 200){
      log("Account Created");
      signupModel = signupModelFromJson(response.body.toString());
      Utils.customToast(message: signupModel!.message.toString());
      firstNameController.clear();
      lastNameController.clear();
      emailController.clear();
      phoneNumberController.clear();
      createPasswordController.clear();
      confirmPasswordController.clear();
      signupPhoneCode = "+92";
      city ="";
      country ="";
      Get.to(() => SignInScreen());
      isUserSigningUp.value = false;
    }else{
      signupModel = signupModelFromJson(response.body.toString());
      Utils.customToast(message: signupModel!.message.toString());
      log("Something Went Wrong");
      isUserSigningUp.value = false;
    }
 }

  // LOGIN
  login({
    required String phoneNumber,
    required String password,
    required String fcmToken,
  })async{
    isUserSigningIn.value = true;
    const endPoint = "/shipper/login";
    final header = {
      "Accept" : "application/json"
    };
    final body = {
      "mobile_number": phoneNumber,
      "password": password,
      "fcm": fcmToken
    };

    final response = await ApiServices.postApi(endPoint: endPoint, header: header, body: body);
    if(response.statusCode == 200){
      log("Account Created");
      loginModel = loginModelFromJson(response.body.toString());
      Utils.customToast(message: "Successfully Logged In");
      saveToken(token: loginModel!.token!.toString());
      loginPhoneController.clear();
      loginPasswordController.clear();
      loginPhoneCode = "+92";
      Get.offAll(() => const BottomBarScreen());
      isUserSigningIn.value = false;
    }else{
      Utils.customToast(message: "Something Went Wrong");
      log("Something Went Wrong");
      isUserSigningIn.value = false;
    }
  }


  // SAVE USER AUTH TOKEN //
 saveToken({required String token})async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('authToken', token);
    log("Token Saved in SP");
 }


}