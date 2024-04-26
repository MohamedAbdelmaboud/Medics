import 'package:flutter/material.dart';

import '../colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
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
