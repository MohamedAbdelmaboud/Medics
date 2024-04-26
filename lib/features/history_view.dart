import 'package:flutter/material.dart';
import 'package:medical_expert_app/core/componants/colors.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.white,
                height: 130,
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Center(
                    child: Image.asset(
                  'assets/images/Rebot 1.png',
                  height: 130,
                  width: 130,
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
