import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/function/app_router.dart';

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

  postHealthDiagnose(context) async {
    emit(HealthDiagnoseLoading());

    try {
      final response = await api.post(
        '${EndPoint.baseUrl}health_diagnose',
        data: {
          "heart_rate": heartRateController.text,
          "blood_sugar": bloodSugarLevelController.text,
          "systolic_bp": systolicBloodPressureController.text,
          "bmi": bodyMassIndexController.text,
          "sodium": sodiumBloodLevelController.text,
          "cholesterol": cholesterolController.text,
          "diastolic_bp": diastolicBloodPressureController.text,
        },
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcxNDIzMjM5MCwianRpIjoiZTQxYjM5ZDgtOGVmZC00YmQxLThhMTAtZmRkN2Q5MDM1MDMxIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6NSwibmJmIjoxNzE0MjMyMzkwLCJjc3JmIjoiYzIwNmNjMTEtNTQwOC00YWIwLWI4YmEtMGY0ZjA1Njg5ZDQ5IiwiZXhwIjoxNzE0MzE4NzkwfQ.vhIwSlLM07-SQmHcivK08L1hcrmfQxPmtXWrSjFZtiQ",
        },
      );
      GoRouter.of(context).push(AppRouter.kGeneralQuestionView);
      emit(HealthDiagnosePosted());
    } catch (e) {
      emit(HealthDiagnoseFailure());
    }
  }
}
