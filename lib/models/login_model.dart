
// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  User? user;
  String? token;
  String? message;
  int? status;

  LoginModel({
    this.user,
    this.token,
    this.message,
    this.status,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    token: json["token"],
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "token": token,
    "message": message,
    "status": status,
  };
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  DateTime? emailVerifiedAt;
  String? verificationCode;
  DateTime? verifyTimeDate;
  int? active;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? country;
  String? city;
  dynamic profilePicture;
  bool? isCarrier;
  dynamic fcmToken;
  int? isCarrierActive;
  dynamic deletedAt;
  dynamic timeZone;
  int? isCompany;
  int? unreadNotification;
  int? showContact;
  int? unreadOnDemandNotification;
  bool? carrierApproved;
  bool? isWallet;
  dynamic carrier;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
    this.emailVerifiedAt,
    this.verificationCode,
    this.verifyTimeDate,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.country,
    this.city,
    this.profilePicture,
    this.isCarrier,
    this.fcmToken,
    this.isCarrierActive,
    this.deletedAt,
    this.timeZone,
    this.isCompany,
    this.unreadNotification,
    this.showContact,
    this.unreadOnDemandNotification,
    this.carrierApproved,
    this.isWallet,
    this.carrier,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    mobileNumber: json["mobile_number"],
    emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
    verificationCode: json["verification_code"],
    verifyTimeDate: json["verify_time_date"] == null ? null : DateTime.parse(json["verify_time_date"]),
    active: json["active"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    country: json["country"],
    city: json["city"],
    profilePicture: json["profile_picture"],
    isCarrier: json["is_carrier"],
    fcmToken: json["fcm_token"],
    isCarrierActive: json["is_carrier_active"],
    deletedAt: json["deleted_at"],
    timeZone: json["time_zone"],
    isCompany: json["is_company"],
    unreadNotification: json["unread_notification"],
    showContact: json["show_contact"],
    unreadOnDemandNotification: json["unread_on_demand_notification"],
    carrierApproved: json["carrier_approved"],
    isWallet: json["is_wallet"],
    carrier: json["carrier"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "mobile_number": mobileNumber,
    "email_verified_at": emailVerifiedAt?.toIso8601String(),
    "verification_code": verificationCode,
    "verify_time_date": verifyTimeDate?.toIso8601String(),
    "active": active,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "country": country,
    "city": city,
    "profile_picture": profilePicture,
    "is_carrier": isCarrier,
    "fcm_token": fcmToken,
    "is_carrier_active": isCarrierActive,
    "deleted_at": deletedAt,
    "time_zone": timeZone,
    "is_company": isCompany,
    "unread_notification": unreadNotification,
    "show_contact": showContact,
    "unread_on_demand_notification": unreadOnDemandNotification,
    "carrier_approved": carrierApproved,
    "is_wallet": isWallet,
    "carrier": carrier,
  };
}
