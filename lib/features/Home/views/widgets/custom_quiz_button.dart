import 'package:flutter/material.dart';

import '../../../../core/componants/colors.dart';

class CustomQuizButton extends StatelessWidget {
  const CustomQuizButton({
    Key? key,
    this.onPressed,
    required this.title,
    this.color = kPrimary,
    this.titleColor = Colors.white,
    this.widget = const SizedBox(),
    this.borderColor = kPrimary,
  }) : super(key: key);
  final Function()? onPressed;
  final String title;
  final Color? color, titleColor;
  final Color borderColor;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 4, spreadRadius: 3, color: kPrimary.withOpacity(.5))
          ],
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(35),
        ),
        // width: double.infinity,
        height: 51,
        child: MaterialButton(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget,
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
