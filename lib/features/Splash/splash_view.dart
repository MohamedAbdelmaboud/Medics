import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_expert_app/core/componants/assets.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:medical_expert_app/core/function/app_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsData.logo),
            const Text(
              'Medical\nExpert\nSystem',
              style: TextStyle(
                color: Colors.white,
                fontSize: 51,
                fontWeight: FontWeight.w900,
                fontFamily: 'Montserrat',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void navigateToHome() async {
    await Future.delayed(const Duration(seconds: 4), () {
      GoRouter.of(context).pushReplacement(AppRouter.kOnBoarding);
    });
  }
}
