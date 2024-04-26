import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_expert_app/core/componants/buttons/custom_botton.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:medical_expert_app/core/function/app_router.dart';
import 'package:medical_expert_app/features/auth/views/widgets/custom_text_from_field.dart';
import 'package:validators/validators.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password, username;
  bool isLoading = false;
  bool isValidate = false;
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
                            'Forgot Your Password?',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Enter your email or your phone number, we will send you confirmation code',
                            style: TextStyle(color: kSecondary3),
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
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
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        title: 'Reset Password',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            isValidate
                                ? GoRouter.of(context)
                                    .push(AppRouter.kCreateNewPasswordView)
                                : null;
                            //   BlocProvider.of<EmailAuthCubit>(context)
                            //       .loginUser(
                            //           emailAddress: email!,
                            //           password: password!);
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
