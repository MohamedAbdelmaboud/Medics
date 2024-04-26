import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_expert_app/core/componants/buttons/custom_botton.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:medical_expert_app/core/function/app_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 106,
            width: double.maxFinite,
            color: kPrimary,
            child: const Padding(
              padding: EdgeInsets.all(22),
              child: Text(
                'Find your desire heart health solution',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Image.asset('assets/images/Rebot 1.png'),
          const Padding(
            padding: EdgeInsets.all(22),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Let’s Start Our test to check your heart health ,it’s takes a few moment.',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 90,
            ),
            child: CustomButton(
                title: 'Start',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kInfoView);
                }),
          ),
        ],
      ),
    );
  }
}
