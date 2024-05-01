import 'package:flutter/material.dart';
import 'package:medical_expert_app/features/Profile/views/widgets/expand_text.dart';

import '../../../core/componants/colors.dart';

class FAQsView extends StatelessWidget {
  const FAQsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            'FAQs',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
        ),
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topRight,
                colors: [
                  kPrimary,
                  kPrimary,
                  kPrimary.withOpacity(0.7),
                ],
              ),
            ),
            height: double.maxFinite,
            width: double.maxFinite,
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset('assets/images/Group 119.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: const Column(
                children: [
                  SizedBox(height: 44),
                  Text('FAQs on Health and Heart Disease:'),
                  Divider(
                    endIndent: 33,
                    indent: 33,
                  ),
                  Flexible(
                      child: ExpandText(
                    sentence: '''What is a normal resting heart rate for adults?
 A normal resting heart rate for adults is between 60 and 100 beats per minute (bpm).''',
                    title: 'HeartBeat',
                  )),
                  Flexible(
                      child: ExpandText(
                    sentence: '''What is a normal resting heart rate for adults?
 A normal resting heart rate for adults is between 60 and 100 beats per minute (bpm).''',
                    title: 'Fasting Blood Sugar',
                  )),
                  Flexible(
                      child: ExpandText(
                    sentence: '''What is a normal resting heart rate for adults?
 A normal resting heart rate for adults is between 60 and 100 beats per minute (bpm).''',
                    title: 'Blood Pressure',
                  )),
                ],
              ),
            ),
          )
        ]));
  }
}
