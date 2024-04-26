import 'package:flutter/material.dart';
import 'package:medical_expert_app/core/componants/buttons/custom_botton.dart';
import 'package:medical_expert_app/core/componants/colors.dart';

class SubQuestionCard extends StatefulWidget {
  const SubQuestionCard({
    Key? key,
    required this.questionText,
    required this.onSelected,
    required this.color,
    required this.currentQuestion,
    this.value,
  }) : super(key: key);

  final String questionText;
  final bool currentQuestion;
  final void Function(String) onSelected;
  final Color color;
  final String? value;

  @override
  State<SubQuestionCard> createState() => _SubQuestionCardState();
}

class _SubQuestionCardState extends State<SubQuestionCard> {
  bool yes = false;
  bool no = false;

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      if (widget.value == 'Yes') {
        yes = true;
      } else if (widget.value == 'No') {
        no = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kSecondary3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              widget.questionText,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: widget.color,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          if (widget.currentQuestion)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    child: CustomButton(
                      borderColor: Colors.transparent,
                      color: yes ? kPrimary : kSecondary3,
                      title: 'Yes',
                      titleColor: yes ? Colors.white : kBlack,
                      onPressed: () {
                        if (!yes) {
                          setState(() {
                            yes = true;
                            no = false;
                            widget.onSelected('Yes');
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: CustomButton(
                      borderColor: Colors.transparent,
                      color: no ? kPrimary : kSecondary3,
                      title: 'No',
                      titleColor: no ? Colors.white : kBlack,
                      onPressed: () {
                        if (!no) {
                          setState(() {
                            yes = false;
                            no = true;
                            widget.onSelected('No');
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
