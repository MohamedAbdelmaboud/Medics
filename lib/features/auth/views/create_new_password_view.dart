import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_expert_app/core/componants/buttons/custom_botton.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:medical_expert_app/core/function/app_router.dart';
import 'package:medical_expert_app/features/auth/views/widgets/custom_password.dart';

class CreateNewPasswordView extends StatefulWidget {
  const CreateNewPasswordView({super.key});

  @override
  State<CreateNewPasswordView> createState() => _CreateNewPasswordViewState();
}

class _CreateNewPasswordViewState extends State<CreateNewPasswordView> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? password;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.chevron_left,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create New Password',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Create your new password to login',
                            style: TextStyle(color: kSecondary3),
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                    CustomPassword(
                      onChanged: (data) {
                        password = data;
                      },
                      labelText: 'Create New Password',
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                    ),
                    CustomPassword(
                      onChanged: (data) {
                        password = data;
                      },
                      labelText: 'Confirm password',
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        title: 'Create Password',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  actionsAlignment:
                                      MainAxisAlignment.spaceAround,
                                  title: Center(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        height: 102,
                                        width: 102,
                                        decoration: const BoxDecoration(
                                            color: kSecondary2,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50))),
                                        child: const Icon(
                                          Icons.done,
                                          color: kPrimary,
                                          size: 70,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'Success',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Your account has been successfully registered',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            color: kSecondary3),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  )),
                                  actions: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40),
                                      child: CustomButton(
                                        title: 'Login',
                                        onPressed: () {
                                          GoRouter.of(context).pushReplacement(
                                              AppRouter.kLoginView);
                                        },
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          }
                        }),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
