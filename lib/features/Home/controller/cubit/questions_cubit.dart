import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_expert_app/features/Home/controller/list_questions.dart';

import '../../../../core/api/api_consumer.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit(this.api) : super(QuestionsInitial());
  final ApiConsumer api;
  List<String> questions = [];
   List<String> answers=[];
  TextEditingController heartRateController = TextEditingController();
  TextEditingController systolicBloodPressureController =
      TextEditingController();
  TextEditingController diastolicBloodPressureController =
      TextEditingController();
  TextEditingController bloodSugarLevelController = TextEditingController();
  TextEditingController bodyMassIndexController = TextEditingController();
  TextEditingController cholesterolController = TextEditingController();
  TextEditingController sodiumBloodLevelController = TextEditingController();
  void getQuestions({
    String? answer1,
    String? answer2,
    String? answer3,
    String? answer4,
    context,
  }) async {
    emit(QuestionsLoading());

    questions = [];
    if (answer1 == 'Yes') {
      answers.add(answer1!);
      questions.addAll(Questions.questions1);
    }
    if (answer2 == 'Yes') {
      answers.add(answer2!);
      questions.addAll(Questions.questions2);
    }
    if (answer3 == 'Yes') {
      answers.add(answer3!);
      questions.addAll(Questions.questions3);
    }
    if (answer4 == 'Yes') {
      answers.add(answer4!);
      questions.addAll(Questions.questions4);
    }

    emit(QuestionsSuccess(questions: questions));
  }
}
