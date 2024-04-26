import 'package:flutter/material.dart';

class BoxTitle extends StatelessWidget {
  const BoxTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            height: 140,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFF5F7FF),
                    Color.fromARGB(89, 245, 247, 255),
                    Color.fromARGB(0, 245, 247, 255),
                  ],
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Text(
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                  title),
            )),
          ),
        ),
      ],
    );
  }
}
