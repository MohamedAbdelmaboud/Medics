import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_expert_app/core/componants/assets.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:medical_expert_app/features/OnBoarding/start_view.dart';
import 'package:medical_expert_app/features/OnBoarding/widgets/box_title.dart';
import 'package:medical_expert_app/features/OnBoarding/widgets/on_boarding.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: OnBoardingSlider(
        pageBackgroundColor: Colors.white,
        headerBackgroundColor: Colors.white,
        finishButtonStyle: const FinishButtonStyle(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          backgroundColor: kPrimary,
        ),
        onFinish: () {},
        skipTextButton: const Text(
          'skip',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerBackground: true,
        controllerColor: kPrimary,
        background: [
          Column(
            children: [
              Image.asset(AssetsData.slide1),
              const Text(
                'Medical\nExpert\nSystem',
                style: TextStyle(
                  fontSize: 51,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Image.asset(AssetsData.slide2),
          Image.asset(AssetsData.slide3),
          const SizedBox(),
        ],
        totalPage: 4,
        speed: 1.8,
        pageBodies: const [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BoxTitle(
                title: 'Welcome in Medical Expert System Mobile App.',
              ),
            ],
          ),
          BoxTitle(
            title:
                'We are try to help you with the best advice for your heart health',
          ),
          BoxTitle(
            title: 'Get connect our Medical Expert System Now.',
          ),
          StartView(),
        ],
      ),
    );
  }
}
