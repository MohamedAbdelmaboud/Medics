class HealthDiagnosis {
  String? bloodSugar;
  String? bmi;
  String? cholesterol;
  String? diastolicBp;
  String? heartRate;
  String? sodium;
  String? systolicBp;

  HealthDiagnosis({
    this.bloodSugar,
    this.bmi,
    this.cholesterol,
    this.diastolicBp,
    this.heartRate,
    this.sodium,
    this.systolicBp,
  });

  factory HealthDiagnosis.fromJson(Map<String, dynamic> json) {
    return HealthDiagnosis(
      bloodSugar: json['blood_sugar'] as String?,
      bmi: json['bmi'] as String?,
      cholesterol: json['cholesterol'] as String?,
      diastolicBp: json['diastolic_bp'] as String?,
      heartRate: json['heart_rate'] as String?,
      sodium: json['sodium'] as String?,
      systolicBp: json['systolic_bp'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'blood_sugar': bloodSugar,
        'bmi': bmi,
        'cholesterol': cholesterol,
        'diastolic_bp': diastolicBp,
        'heart_rate': heartRate,
        'sodium': sodium,
        'systolic_bp': systolicBp,
      };
}
