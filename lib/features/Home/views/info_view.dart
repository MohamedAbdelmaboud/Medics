import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_expert_app/core/componants/buttons/custom_botton.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:medical_expert_app/core/function/app_router.dart';
import 'package:medical_expert_app/features/Home/views/widgets/custom_text_field.dart';
import 'package:medical_expert_app/features/Home/views/widgets/date_picker.dart';

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Self-declaration of heart disease',
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
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              color: kPrimary,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Please Fill This required informations',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Column(
                    children: [
                      const DatePicker(
                        title: 'Please Enter your Age',
                        subtitle: 'Years',
                      ),
                      const CustomTextField(
                        labelText: 'Type Here',
                        title: 'Heart Rate',
                        subtitle: '(bpm)',
                      ),
                      const CustomTextField(
                        labelText: 'Type Here',
                        title: 'Systolic  Blood Pressure',
                        subtitle: '(mmHg)',
                      ),
                      const CustomTextField(
                        labelText: 'Type Here',
                        title: 'Diastolic Blood Pressure',
                        subtitle: '(mmHg)',
                      ),
                      const CustomTextField(
                        labelText: 'Type Here',
                        title: 'Blood Sugar level ',
                        subtitle: '(Mg/DL)',
                      ),
                      const CustomTextField(
                        labelText: 'Type Here',
                        title: 'body mass index ',
                        subtitle: '(kg/m^2)',
                      ),
                      const CustomTextField(
                        labelText: 'Type Here',
                        title: 'cholesterol ',
                        subtitle: '(Mg/DL)',
                      ),
                      const CustomTextField(
                        labelText: 'Type Here',
                        title: 'sodium blood level',
                        subtitle: '(mEq/L)',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomButton(
                            title: 'Submit',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                GoRouter.of(context)
                                    .push(AppRouter.kGenerlaQuestionView);
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
