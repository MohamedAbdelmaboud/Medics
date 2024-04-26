import 'package:bloc/bloc.dart';
import 'package:medical_expert_app/features/Home/controller/list_questions.dart';
import 'package:meta/meta.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsInitial());
  List<String> questions = [];
  void getQuestions(
      {String? answer1, String? answer2, String? answer3, String? answer4}) {
    emit(QuestionsLoading());

    try {
      questions = [];
      if (answer1 == 'Yes') {
        questions.addAll(Questhins.questions1);
      }
      if (answer2 == 'Yes') {
        questions.addAll(Questhins.questions2);
      }
      if (answer3 == 'Yes') {
        questions.addAll(Questhins.questions3);
      }
      if (answer4 == 'Yes') {
        questions.addAll(Questhins.questions4);
      }
      emit(QuestionsSuccess(questions: questions));
    } on Exception catch (e) {
      emit(QuestionsFailure(error: e.toString()));
    }
  }
}
