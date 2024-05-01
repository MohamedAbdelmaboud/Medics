class DiseaseDiagnosis {
  String? diagnosis;
  int? diagnosisId;
  String? treatment;

  DiseaseDiagnosis({this.diagnosis, this.diagnosisId, this.treatment});

  factory DiseaseDiagnosis.fromJson(Map<String, dynamic> json) {
    return DiseaseDiagnosis(
      diagnosis: json['diagnosis'] as String?,
      diagnosisId: json['diagnosis_id'] as int?,
      treatment: json['treatment'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'diagnosis': diagnosis,
        'diagnosis_id': diagnosisId,
        'treatment': treatment,
      };
}
