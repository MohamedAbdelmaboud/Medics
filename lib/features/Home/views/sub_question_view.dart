import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_expert_app/core/componants/buttons/custom_botton.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:medical_expert_app/core/function/app_router.dart';
import 'package:medical_expert_app/features/Home/controller/cubit/health_diagnose_cubit.dart';
import 'package:medical_expert_app/features/Home/controller/cubit/questions_cubit.dart';
import 'package:medical_expert_app/features/Home/views/widgets/sub_question_card.dart';

class SubQuestionView extends StatefulWidget {
  const SubQuestionView({Key? key}) : super(key: key);
  @override
  State<SubQuestionView> createState() => _SubQuestionViewState();
}

class _SubQuestionViewState extends State<SubQuestionView> {
  int currentQuestionIndex = 0;
  List<String?> answers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
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
      body: BlocBuilder<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
          if (state is QuestionsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is QuestionsSuccess) {
            if (currentQuestionIndex == 0) {
              answers = List.filled(
                state.questions.length,
                null,
              );
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.questions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SubQuestionCard(
                          value: answers[index],
                          color: currentQuestionIndex == index
                              ? Colors.red
                              : Colors.black,
                          questionText:
                              '${index + 1}- ${state.questions[index]}?',
                          onSelected: (value) {
                            setState(() {
                              if (answers[index] == null) {
                                currentQuestionIndex++;
                              }
                              answers[index] = value;
                            });
                          },
                          currentQuestion: currentQuestionIndex >= index,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                  child: CustomButton(
                      borderColor: Colors.transparent,
                      color: !answers.any((element) => element == null)
                          ? kPrimary
                          : kSecondary3,
                      title: 'Next',
                      onPressed: !answers.any((element) => element == null)
                          ? () {
                              GoRouter.of(context).push(AppRouter.kResultView);
                            }
                          : null),
                ),
              ],
            );
          } else if (state is QuestionsFailure) {
            return Center(
              child: Text(state.error),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
