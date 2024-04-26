part of 'questions_cubit.dart';

@immutable
sealed class QuestionsState {}

final class QuestionsInitial extends QuestionsState {}

final class QuestionsLoading extends QuestionsState {}

final class QuestionsSuccess extends QuestionsState {
  final List<String> questions;

  QuestionsSuccess({required this.questions});
}

final class QuestionsFailure extends QuestionsState {
  final String error;

  QuestionsFailure({required this.error});
}
