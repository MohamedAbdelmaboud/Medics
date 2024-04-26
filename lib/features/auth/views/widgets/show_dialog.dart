import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_expert_app/core/componants/buttons/custom_botton.dart';
import 'package:medical_expert_app/core/function/app_router.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceAround,
      title: Center(
          child: Text(
        'Alert',
        style: const TextStyle(
          fontFamily: 'Inter',
        ),
      )),
      actions: <Widget>[
        CustomButton(
          title: title,
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRouter.kSignUpView);
          },
        )
      ],
    );
  }
}
