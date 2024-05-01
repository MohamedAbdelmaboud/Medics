import 'package:medical_expert_app/core/api/end_ponits.dart';

class UserModel {
  String? patientName;
  int? patientAge;
  String? patientGender;
  String? patientCity;
  String? patientPhone;
  String? patientEmail;
  String? patientPassword;

  UserModel({
    this.patientName,
    this.patientAge,
    this.patientGender,
    this.patientCity,
    this.patientPhone,
    this.patientEmail,
    this.patientPassword,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        patientName: json[ApiKeys.name] as String?,
        patientAge: json[ApiKeys.age] as int?,
        patientGender: json[ApiKeys.gender] as String?,
        patientCity: json[ApiKeys.location] as String?,
        patientPhone: json[ApiKeys.phone] as String?,
        patientEmail: json[ApiKeys.email] as String?,
        patientPassword: json[ApiKeys.password] as String?,
      );
}
