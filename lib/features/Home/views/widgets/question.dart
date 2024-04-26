import 'package:flutter/material.dart';
import 'package:medical_expert_app/core/componants/colors.dart';

class Question extends StatefulWidget {
  const Question({
    super.key,
    required this.questionText,
    required this.onSelected,
    required this.color,
    required this.currentQuestion,
    this.value,
  });
  final String questionText;
  final bool currentQuestion;
  final void Function(String) onSelected;
  final Color color;
  final String? value;
  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  String? groupValue;
  @override
  void initState() {
    if (widget.value != null) {
      groupValue = widget.value;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.questionText,
            style: TextStyle(
              fontSize: 20,
              color: groupValue == null ? widget.color : Colors.black,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          if (widget.currentQuestion)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    value: "Yes",
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                        widget.onSelected(value);
                      });
                    },
                    title: const Text(
                      "Yes",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    activeColor: kPrimary,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    value: "No",
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                        widget.onSelected(value);
                      });
                    },
                    title: const Text(
                      "No",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    activeColor: kPrimary,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
