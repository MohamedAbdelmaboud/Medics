import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_expert_app/core/componants/buttons/custom_botton.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:medical_expert_app/core/function/app_router.dart';
import 'package:medical_expert_app/features/auth/cubit/auth_cubit.dart';
import 'package:medical_expert_app/features/auth/views/widgets/custom_password.dart';
import 'package:medical_expert_app/features/auth/views/widgets/custom_text_from_field.dart';
import 'package:validators/validators.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password, username;
  bool isLoading = false;
  bool isValidate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sign Up',
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
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Success'),
            ));
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFromField(
                          onChanged: (data) {
                            username = data;
                          },
                          controller: context.read<AuthCubit>().signUpName,
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
                          controller: context.read<AuthCubit>().signUpEmail,
                          color: isValidate ? kPrimary : Colors.red,
                          labelText: 'Enter your email',
                          prefixIcon: const Icon(
                            Icons.email,
                          ),
                        ),
                        CustomTextFromField(
                          onChanged: (data) {
                            setState(() {
                              isValidate = isEmail(data!);
                              email = data;
                            });
                          },
                          controller: context.read<AuthCubit>().signUpLocation,
                          color: isValidate ? kPrimary : Colors.red,
                          labelText: 'Enter your City',
                          prefixIcon: const Icon(
                            Icons.location_city,
                          ),
                        ),
                        CustomTextFromField(
                          onChanged: (data) {
                            setState(() {
                              isValidate = isEmail(data!);
                              email = data;
                            });
                          },
                          controller: context.read<AuthCubit>().signUpAge,
                          color: isValidate ? kPrimary : Colors.red,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your age.';
                            }
                            return null;
                          },
                          labelText: 'Enter your age',
                          prefixIcon: const Icon(
                            Icons.numbers_rounded,
                          ),
                        ),
                        CustomTextFromField(
                          onChanged: (data) {
                            setState(() {
                              isValidate = isEmail(data!);
                              email = data;
                            });
                          },
                          controller: context.read<AuthCubit>().signUpPhone,
                          color: isValidate ? kPrimary : Colors.red,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone.';
                            }
                            return null;
                          },
                          labelText: 'Enter your phone',
                          prefixIcon: const Icon(
                            Icons.phone,
                          ),
                        ),
                        CustomPassword(
                          onChanged: (data) {
                            password = data;
                          },
                          controller: context.read<AuthCubit>().signUpPassword,
                          labelText: 'Enter your password',
                          prefixIcon: const Icon(
                            Icons.lock,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        state is SignUpLoading
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                title: 'Sign Up',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<AuthCubit>(context)
                                        .signUp();
                                  }
                                  //   BlocProvider.of<EmailAuthCubit>(context)
                                  //       .loginUser(
                                  //           emailAddress: email!,
                                  //           password: password!);
                                }),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'I already have an account.',
                                style: TextStyle(
                                  color: kSecondary3,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  GoRouter.of(context)
                                      .push(AppRouter.kLoginView);
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: kPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
