import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_expert_app/core/componants/assets.dart';
import 'package:medical_expert_app/core/componants/buttons/custom_botton.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:medical_expert_app/core/function/app_router.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(75),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AssetsData.logo2),
          const SizedBox(
            height: 35,
          ),
          const Text(
            'Let’s get started!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Login to enjoy the features we’ve provided, and stay healthy!',
            style: TextStyle(
                fontWeight: FontWeight.w400, color: Color(0xFF717784)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 35,
          ),
          CustomButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kLoginView);
            },
            title: 'Login',
          ),
          CustomButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSignUpView);
            },
            color: Colors.transparent,
            titleColor: kPrimary,
            title: 'Sign Up',
          ),
          const SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
