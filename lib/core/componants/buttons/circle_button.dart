import 'package:flutter/material.dart';

import '../colors.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  const CircleButton({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
        color: kSecondary,
        // border: Border.all(color: kPrimary, width: 1),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 24,
          color: kPrimary,
        ),
      ),
    );
  }
}
