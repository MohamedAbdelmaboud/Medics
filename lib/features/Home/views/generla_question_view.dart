import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_expert_app/core/componants/buttons/custom_botton.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:medical_expert_app/core/function/app_router.dart';
import 'package:medical_expert_app/features/Home/controller/cubit/questions_cubit.dart';
import 'package:medical_expert_app/features/Home/views/widgets/question.dart';

class GenerlaQuestionView extends StatefulWidget {
  const GenerlaQuestionView({super.key});

  @override
  State<GenerlaQuestionView> createState() => _GenerlaQuestionViewState();
}

class _GenerlaQuestionViewState extends State<GenerlaQuestionView> {
  String? answer1, answer2, answer3, answer4;
  Color color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Self-declaration of heart disease',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.chevron_left,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Question(
                    color: color,
                    questionText: '1-do you have shortness of breath ?',
                    onSelected: (value) {
                      setState(() {
                        answer1 = value;
                      });
                    },
                    currentQuestion: true,
                  ),
                  Question(
                    color: color,
                    questionText: '2-do you have chest pain ?',
                    onSelected: (value) {
                      setState(() {
                        answer2 = value;
                      });
                    },
                    currentQuestion: true,
                  ),
                  Question(
                    color: color,
                    questionText: '3-do you have blue skin colour ?',
                    onSelected: (value) {
                      setState(() {
                        answer3 = value;
                      });
                    },
                    currentQuestion: true,
                  ),
                  Question(
                    color: color,
                    questionText: '4-do you have swilling ',
                    onSelected: (value) {
                      setState(() {
                        answer4 = value;
                      });
                    },
                    currentQuestion: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          child: CustomButton(
              title: 'Next',
              onPressed: () {
                if (answer1 != null &&
                    answer2 != null &&
                    answer3 != null &&
                    answer4 != null) {
                  BlocProvider.of<QuestionsCubit>(context).getQuestions(
                      answer1: answer1,
                      answer2: answer2,
                      answer3: answer3,
                      answer4: answer4);

                  GoRouter.of(context).push(AppRouter.kSubQuestionView);
                } else {
                  setState(() {
                    color = Colors.red;
                  });
                }
              }),
        ),
      ),
    );
  }
}
