import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    Key? key,
    this.ontap,
    required this.color,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final Function()? ontap;
  final Color color;
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap!,
      child: Container(
        width: 138,
        height: 150,
        decoration: BoxDecoration(
          // color: Colors.black12,
          border: Border.all(width: 2, color: color),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color,
              child: Icon(size: 32, color: Colors.white, icon),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(title,
                  style: TextStyle(
                    color: color,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
