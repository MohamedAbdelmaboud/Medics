import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_expert_app/core/api/dio_consumer.dart';
import 'package:medical_expert_app/core/cache/cache_helper.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:medical_expert_app/core/function/app_router.dart';
import 'package:medical_expert_app/features/Home/controller/cubit/health_diagnose_cubit.dart';
import 'package:medical_expert_app/features/Home/controller/cubit/questions_cubit.dart';
import 'package:medical_expert_app/features/auth/cubit/auth_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (context) => HealthDiagnoseCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (context) => QuestionsCubit(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          fontFamily: 'Inter',
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
