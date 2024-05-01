import 'disease_diagnosis.dart';
import 'health_diagnosis.dart';

class HealthReportModel {
  DiseaseDiagnosis? diseaseDiagnosis;
  HealthDiagnosis? healthDiagnosis;
  String? message;

  HealthReportModel({
    this.diseaseDiagnosis,
    this.healthDiagnosis,
    this.message,
  });

  factory HealthReportModel.fromJson(Map<String, dynamic> json) {
    return HealthReportModel(
      diseaseDiagnosis: json['disease_diagnosis'] == null
          ? null
          : DiseaseDiagnosis.fromJson(
              json['disease_diagnosis'] as Map<String, dynamic>),
      healthDiagnosis: json['health_diagnosis'] == null
          ? null
          : HealthDiagnosis.fromJson(
              json['health_diagnosis'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'disease_diagnosis': diseaseDiagnosis?.toJson(),
        'health_diagnosis': healthDiagnosis?.toJson(),
        'message': message,
      };
}
