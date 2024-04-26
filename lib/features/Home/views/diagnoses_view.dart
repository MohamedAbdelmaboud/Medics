import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_expert_app/core/componants/buttons/custom_botton.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:medical_expert_app/core/function/app_router.dart';

class DiagnosesView extends StatefulWidget {
  const DiagnosesView({super.key});

  @override
  State<DiagnosesView> createState() => _DiagnosesViewState();
}

class _DiagnosesViewState extends State<DiagnosesView> {
  String text = 'diagnose #';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kBlack.withOpacity(0.2),
                kBlack.withOpacity(0.99),
              ],
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      color: kPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                const Row(
                  children: [
                    Text(
                      '‘‘',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 60),
                    ),
                  ],
                ),
                const Spacer(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      ',,',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 60),
                    ),
                  ],
                ),
                const SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '',
                      )),
                ),
                Image.asset(
                  'assets/images/Group 427318805.png',
                ),
                const Divider()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 165,
                child: CustomButton(
                    color: kBlack,
                    title: 'back',
                    onPressed: () {
                      if (text == 'Treatment #') {
                        setState(() {
                          text = 'diagnose #';
                        });
                      } else {
                        GoRouter.of(context).pop();
                      }
                    })),
            SizedBox(
                width: 165,
                child: CustomButton(
                    color: kBlack,
                    title: 'continue',
                    onPressed: () {
                      if (text == 'Treatment #') {
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.kController);
                      }
                      setState(() {
                        text = 'Treatment #';
                      });
                    })),
          ],
        ),
      ),
    );
  }
}
