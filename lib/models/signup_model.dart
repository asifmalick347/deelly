// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  String? message;
  User? user;
  String? token;
  int? status;

  SignupModel({
    this.message,
    this.user,
    this.token,
    this.status,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
    message: json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    token: json["token"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user?.toJson(),
    "token": token,
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
  String? fcmToken;
  int? isCarrierActive;
  dynamic deletedAt;
  dynamic timeZone;
  int? isCompany;
  int? unreadNotification;
  int? showContact;
  int? unreadOnDemandNotification;
  bool? carrierApproved;
  bool? isWallet;
  List<Role>? roles;
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
    this.roles,
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
    roles: json["roles"] == null ? [] : List<Role>.from(json["roles"]!.map((x) => Role.fromJson(x))),
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
    "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x.toJson())),
    "carrier": carrier,
  };
}

class Role {
  int? id;
  String? name;
  int? active;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;

  Role({
    this.id,
    this.name,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    active: json["active"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "active": active,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
  };
}

class Pivot {
  int? userId;
  int? roleId;

  Pivot({
    this.userId,
    this.roleId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    userId: json["user_id"],
    roleId: json["role_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "role_id": roleId,
  };
}
