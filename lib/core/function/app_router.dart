import 'package:go_router/go_router.dart';
import 'package:medical_expert_app/controller.dart';
import 'package:medical_expert_app/features/Home/views/diagnoses_view.dart';
import 'package:medical_expert_app/features/Home/views/generla_question_view.dart';
import 'package:medical_expert_app/features/Home/views/home_view.dart';
import 'package:medical_expert_app/features/Home/views/info_view.dart';
import 'package:medical_expert_app/features/Home/views/result_view.dart';
import 'package:medical_expert_app/features/Home/views/sub_question_view.dart';
import 'package:medical_expert_app/features/OnBoarding/onboarding.dart';
import 'package:medical_expert_app/features/Profile/views/edit_profile_view.dart';
import 'package:medical_expert_app/features/Profile/views/faqs_view.dart';
import 'package:medical_expert_app/features/auth/views/create_new_password_view.dart';
import 'package:medical_expert_app/features/auth/views/forgot_password.dart';
import 'package:medical_expert_app/features/auth/views/login_view.dart';
import 'package:medical_expert_app/features/auth/views/signup_view.dart';

import '../../Features/Splash/splash_view.dart';

abstract class AppRouter {
  static const kOnBoarding = '/OnBoarding';
  static const kLoginView = '/LoginView';
  static const kSignUpView = '/SignUpView';
  static const kForgotPasswordView = '/ForgotPasswordView';
  static const kCreateNewPasswordView = '/CreateNewPasswordView';
  static const kController = '/Controller';
  static const kHomeView = '/HomeView';
  static const kEditProfileView = '/EditProfileView';
  static const kFaqsView = '/kFaqsView';
  static const kInfoView = '/InfoView';
  static const kGenerlaQuestionView = '/GenerlaQuestionView';
  static const kSubQuestionView = '/SubQuestionView';

  static const kResultView = '/ResultView';
  static const kDiagnosesView = '/DiagnosesView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kOnBoarding,
      builder: (context, state) => const OnBoarding(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kSignUpView,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: kForgotPasswordView,
      builder: (context, state) => const ForgotPasswordView(),
    ),
    GoRoute(
      path: kCreateNewPasswordView,
      builder: (context, state) => const CreateNewPasswordView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kEditProfileView,
      builder: (context, state) => const EditProfileView(),
    ),
    GoRoute(
      path: kFaqsView,
      builder: (context, state) => const FAQsView(),
    ),
    GoRoute(
      path: kController,
      builder: (context, state) => const Controller(),
    ),
    GoRoute(
      path: kInfoView,
      builder: (context, state) => const InfoView(),
    ),
    GoRoute(
      path: kGenerlaQuestionView,
      builder: (context, state) => const GenerlaQuestionView(),
    ),
    GoRoute(
      path: kSubQuestionView,
      builder: (context, state) => const SubQuestionView(),
    ),
    GoRoute(
      path: kResultView,
      builder: (context, state) => const ResultView(),
    ),
    GoRoute(
      path: kDiagnosesView,
      builder: (context, state) => const DiagnosesView(),
    ),
  ]);
}
