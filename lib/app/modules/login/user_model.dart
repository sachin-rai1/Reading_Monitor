import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.user,
    this.token,
  });

  UserClass ? user;
  String ? token;

  factory User.fromJson(Map<String, dynamic> json) => User(
    user: UserClass.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "token": token,
  };
}

class UserClass {
  UserClass({
    this.id,
    this.roleType,
    this.photo,
    this.firstname,
    this.surname,
    this.companyName,
   required this.email,
    this.gender,
    this.mobileCode,
    this.mobileNo,
    this.address,
    this.mPassword,
    this.status,
    this.otp,
    this.otpSession,
    this.logginedBy,
    this.socialToken,
    this.token,
    this.createdAt,
    this.updatedAt,
  });

  int ? id;
  int ? roleType;
  dynamic photo;
  String ?firstname;
  String ?surname;
  String ?companyName;
  String email;
  dynamic gender;
  String ?mobileCode;
  String ?mobileNo;
  String ?address;
  dynamic mPassword;
  int ? status;
  dynamic otp;
  dynamic otpSession;
  int ?logginedBy;
  dynamic socialToken;
  dynamic token;
  DateTime ?createdAt;
  DateTime ?updatedAt;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
    id: json["id"],
    roleType: json["role_type"],
    photo: json["photo"],
    firstname: json["firstname"],
    surname: json["surname"],
    companyName: json["company_name"],
    email: json["email"],
    gender: json["gender"],
    mobileCode: json["mobile_code"],
    mobileNo: json["mobile_no"],
    address: json["address"],
    mPassword: json["m_password"],
    status: json["status"],
    otp: json["otp"],
    otpSession: json["otp_session"],
    logginedBy: json["loggined_by"],
    socialToken: json["social_token"],
    token: json["_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role_type": roleType,
    "photo": photo,
    "firstname": firstname,
    "surname": surname,
    "company_name": companyName,
    "email": email,
    "gender": gender,
    "mobile_code": mobileCode,
    "mobile_no": mobileNo,
    "address": address,
    "m_password": mPassword,
    "status": status,
    "otp": otp,
    "otp_session": otpSession,
    "loggined_by": logginedBy,
    "social_token": socialToken,
    "_token": token,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
