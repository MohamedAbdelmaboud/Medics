import 'package:flutter/material.dart';

import 'package:medical_expert_app/core/componants/buttons/circle_button.dart';
import 'package:medical_expert_app/core/componants/colors.dart';

class CusttomContent extends StatelessWidget {
  const CusttomContent({
    Key? key,
    this.onTap,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final void Function()? onTap;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            CircleButton(icon: icon),
            const SizedBox(
              width: 9,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_back_ios_new,
              color: kSecondary3,
              textDirection: TextDirection.rtl,
            )
          ],
        ),
      ),
    );
  }
}
