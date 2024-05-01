import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';

part 'health_diagnose_state.dart';

class HealthDiagnoseCubit extends Cubit<HealthDiagnoseState> {
  HealthDiagnoseCubit(this.api) : super(HealthDiagnoseInitial());
  final ApiConsumer api;
  TextEditingController heartRateController = TextEditingController();
  TextEditingController systolicBloodPressureController =
      TextEditingController();
  TextEditingController diastolicBloodPressureController =
      TextEditingController();
  TextEditingController bloodSugarLevelController = TextEditingController();
  TextEditingController bodyMassIndexController = TextEditingController();
  TextEditingController cholesterolController = TextEditingController();
  TextEditingController sodiumBloodLevelController = TextEditingController();

  postHealthDiagnose(
    context,
    String? answer1,
    String? answer2,
    String? answer3,
    String? answer4,
  ) async {
    emit(HealthDiagnoseLoading());

    try {
      final Response response = await api.post(
        '${EndPoint.baseUrl}health_diagnose',
        data: {
          "heart_rate": heartRateController.text,
          "blood_sugar": bloodSugarLevelController.text,
          "systolic_bp": systolicBloodPressureController.text,
          "bmi": bodyMassIndexController.text,
          "sodium": sodiumBloodLevelController.text,
          "cholesterol": cholesterolController.text,
          "diastolic_bp": diastolicBloodPressureController.text,
          "symptoms": {
            "shortness_of_breath": answer1 == 'Yes' ? true : false,
            "Chest_pain": answer2 == 'Yes' ? true : false,
            "Blue_skin_color": answer3 == 'Yes' ? true : false,
            "Swilling": answer4 == 'Yes' ? true : false,
            //! will change the bool and get the answer from the ui
            "abdominal_pain": answer1 == 'No' ? null : true,
            "chills": answer1 == 'No' ? null : true,
            "fever": answer1 == 'No' ? null : true,
            "muscle_joint_pain": answer1 == 'No' ? null : true,
            "abdomen_swelling": answer1 == 'No' ? null : true,
            "coughing": answer1 == 'No' ? null : true,
            "difficulty_concentrating": answer1 == 'No' ? null : true,
            "swollen_legs": answer1 == 'No' ? null : true,
            "night_sweats": answer1 == 'No' ? null : true,
            "pain_in_neck": answer1 == 'No' ? null : true,
            "upper_belly_area": answer1 == 'No' ? null : true,
            "Weight_loss": answer1 == 'No' ? null : true,
            "pain_on_sholder_left": answer1 == 'No' ? null : true,
            "irregular_heartbeats": answer1 == 'No' ? null : true,
            "poor_appetite": answer1 == 'No' ? null : true,
            "weakness": answer1 == 'No' ? null : true,
            "Rapid_or_irregular_breathing": answer2 == 'No' ? null : true,
            "Fatigue": answer2 == 'No' ? null : true,
            "Dizziness": answer2 == 'No' ? null : true,
            "Loss_of_consciousness": answer2 == 'No' ? null : true,
            "lightheadedness": answer2 == 'No' ? null : true,
            "Discomfort_in_arms": answer2 == 'No' ? null : true,
            "Cough": answer2 == 'No' ? null : true,
            "wheezing": answer2 == 'No' ? null : true,
            "Heartbeat_changes": answer2 == 'No' ? null : true,
            "Dry": answer2 == 'No' ? null : true,
            "persistent_cough": answer2 == 'No' ? null : true,
            "Skin_rashes": answer3 == 'No' ? null : true,
            "Cold_sweat": answer3 == 'No' ? null : true,
            "Discomfort_in_neck": answer3 == 'No' ? null : true,
            "nausea": answer3 == 'No' ? null : true,
            "Pain_in_left_arms": answer3 == 'No' ? null : true,
            "Abnormal_growth": answer3 == 'No' ? null : true,
            "stroke": answer3 == 'No' ? null : true,
            "Chest_pressure": answer3 == 'No' ? null : true,
            "Pain_in_neck": answer3 == 'No' ? null : true,
            "Feeding_difficulties": answer3 == 'No' ? null : true,
            "Poor_weight_gain": answer3 == 'No' ? null : true,
            "Signs_of_infection": answer3 == 'No' ? null : true,
            "Changes_in_temperature": answer3 == 'No' ? null : true,
            "Night_sweats": answer3 == 'No' ? null : true,
            "Increased_heart_rate": answer3 == 'No' ? null : true,
            "dizziness": answer3 == 'No' ? null : true,
            "Pain_in_legs": answer3 == 'No' ? null : true,
            "fatigue": answer3 == 'No' ? null : true,
            "Pain_in_right_arms": answer3 == 'No' ? null : true,
            "Rapid_weight_gain": answer3 == 'No' ? null : true,
            "Decreased_urine_output": answer3 == 'No' ? null : true,
            "Vision_change": answer4 == 'No' ? null : true,
            "Numbness": answer4 == 'No' ? null : true,
            "Chest_tightness": answer4 == 'No' ? null : true,
            "Chest_pressure": answer4 == 'No' ? null : true,
            "Severe_pain": answer4 == 'No' ? null : true,
            "Difficulty_breathing": answer4 == 'No' ? null : true,
            "Loss_of_consciousness": answer4 == 'No' ? null : true,
            "Pallor_or_profuse_sweating": answer4 == 'No' ? null : true,
            "headaches": answer4 == 'No' ? null : true,
            "Dizziness": answer4 == 'No' ? null : true,
            "Anxiety": answer4 == 'No' ? null : true,
            "strong_heartbeat": answer4 == 'No' ? null : true
          }
        },
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcxNDIzMjM5MCwianRpIjoiZTQxYjM5ZDgtOGVmZC00YmQxLThhMTAtZmRkN2Q5MDM1MDMxIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6NSwibmJmIjoxNzE0MjMyMzkwLCJjc3JmIjoiYzIwNmNjMTEtNTQwOC00YWIwLWI4YmEtMGY0ZjA1Njg5ZDQ5IiwiZXhwIjoxNzE0MzE4NzkwfQ.vhIwSlLM07-SQmHcivK08L1hcrmfQxPmtXWrSjFZtiQ",
        },
      );
      print(response.data);
      emit(HealthDiagnosePosted());
    } catch (e) {
      emit(HealthDiagnoseFailure());
    }
  }
}
