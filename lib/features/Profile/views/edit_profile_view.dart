import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_expert_app/core/componants/buttons/custom_botton.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:medical_expert_app/features/Profile/views/widgets/custom_picker_image.dart';
import 'package:medical_expert_app/features/auth/views/widgets/custom_password.dart';
import 'package:medical_expert_app/features/auth/views/widgets/custom_text_from_field.dart';
import 'package:validators/validators.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password, username;
  bool isLoading = false;
  bool isValidate = false;
  File? profileImage;
  String? profileImageName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Edit Profile',
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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPickerImages(
                      onImageSelected: (image, imageName) {
                        setState(() {
                          profileImage = image;
                          profileImageName = imageName;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFromField(
                      onChanged: (data) {
                        username = data;
                      },
                      labelText: 'Enter your name',
                      prefixIcon: const Icon(
                        Icons.person,
                      ),
                    ),
                    CustomTextFromField(
                      onChanged: (data) {
                        setState(() {
                          isValidate = isEmail(data!);
                          email = data;
                        });
                      },
                      color: isValidate ? kPrimary : Colors.red,
                      labelText: 'Enter your email',
                      prefixIcon: const Icon(
                        Icons.email,
                      ),
                    ),
                    CustomPassword(
                      onChanged: (data) {
                        password = data;
                      },
                      labelText: 'Enter your password',
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                        title: 'Save changes',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            isValidate
                                ? showDialog(
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
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                              title: 'OK',
                                              onPressed: () {
                                                GoRouter.of(context).pop();
                                                GoRouter.of(context).pop();
                                              },
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  )
                                : null;
                            //   BlocProvider.of<EmailAuthCubit>(context)
                            //       .loginUser(
                            //           emailAddress: email!,
                            //           password: password!);
                          }
                        }),
                    const SizedBox(
                      height: 100,
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
