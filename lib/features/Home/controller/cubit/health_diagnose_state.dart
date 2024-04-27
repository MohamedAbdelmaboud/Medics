part of 'health_diagnose_cubit.dart';

@immutable
sealed class HealthDiagnoseState {}

final class HealthDiagnoseInitial extends HealthDiagnoseState {

}

final class HealthDiagnoseLoading extends HealthDiagnoseState {

}
final class HealthDiagnosePosted extends HealthDiagnoseState {

}
final class HealthDiagnoseFailure extends HealthDiagnoseState {

}

