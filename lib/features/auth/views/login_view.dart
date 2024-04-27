import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_expert_app/core/componants/buttons/custom_botton.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:medical_expert_app/core/function/app_router.dart';
import 'package:medical_expert_app/features/auth/cubit/auth_cubit.dart';
import 'package:medical_expert_app/features/auth/views/signup_view.dart';
import 'package:medical_expert_app/features/auth/views/widgets/custom_password.dart';
import 'package:medical_expert_app/features/auth/views/widgets/custom_text_from_field.dart';
import 'package:validators/validators.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  bool isLoading = false;
  bool isValidate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Login',
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
          if (state is SignInSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Success'),
            ));
          } else if (state is SignInFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errMessage),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                GoRouter.of(context)
                                    .push(AppRouter.kForgotPasswordView);
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: kPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                        state is SignInLoading
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                title: 'Login',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AuthCubit>().signIn(context);
                                  }
                                }),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don’t have an account?',
                                style: TextStyle(
                                  color: kSecondary3,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const SignUpView();
                                  }));
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: kPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const Divider(
                                color: kSecondary3,
                              ),
                              Container(
                                color: Colors.white,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'OR',
                                    style: TextStyle(color: kSecondary3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomButton(
                          titleColor: kBlack,
                          color: Colors.transparent,
                          title: 'Sign in with Google',
                          onPressed: () {
                            // BlocProvider.of<EmailAuthCubit>(context)
                            //     .signInWithGoogle();
                          },
                        ),
                        CustomButton(
                          titleColor: kBlack,
                          color: Colors.transparent,
                          title: 'Sign in with Facebook',
                          onPressed: () {
                            // BlocProvider.of<EmailAuthCubit>(context)
                            //     .signInWithGoogle();
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
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
