import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_expert_app/core/componants/buttons/custom_botton.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:medical_expert_app/core/function/app_router.dart';
import 'package:medical_expert_app/features/Home/views/widgets/line_chart.dart';
import 'package:medical_expert_app/features/Home/views/widgets/rating_result.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  List<String> name = [
    'Heart Rate',
    'systolic blood pressure ',
    'blood sugar level ',
    'diastolic blood pressure ',
    ' body mass index ',
    ' cholesterol ',
  ];
  List<String> title = [
    '130/90  bpm',
    '180 mmHg',
    '81  mg/dL',
    '130 mmHg',
    '120 kg/m^2',
    '180  mg/dL',
  ];
  List<double> rating = [3, 6, 4, 8, 5, 9];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Result',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.chevron_left,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const LineChartSample10(),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: name.length,
                    itemBuilder: (context, index) {
                      return RatingResult(
                        name: name[index],
                        title: title[index],
                        rating: rating[index],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          child: CustomButton(
              title: 'Submit',
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kDiagnosesView);
              }),
        ),
      ),
    );
  }
}
