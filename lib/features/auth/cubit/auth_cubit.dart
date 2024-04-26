import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medical_expert_app/core/api/end_ponits.dart';

import '../../../core/api/api_consumer.dart';
import '../models/sign_in_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.api) : super(AuthInitial());
  final ApiConsumer api;

  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpAge = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signUpLocation = TextEditingController();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  signUp() async {
    Dio dio = Dio();

    emit(SignUpLoading());
    try {
      final response = await api.post('${EndPoint.baseUrl}signup', data: {
        ApiKeys.name: signUpName.text,
        ApiKeys.age: signUpAge.text,
        ApiKeys.gender: "Male",
        ApiKeys.location: signUpLocation.text,
        ApiKeys.phone: signUpPhone.text,
        ApiKeys.email: signUpEmail.text,
        ApiKeys.password: signUpPassword.text
      });
      emit(SignUpSuccess());
      debugPrint(response.data);
    } catch (e) {
      emit(SignUpFailure(errMessage: e.toString()));
    }
  }

  signIn() async {
    emit(SignInLoading());
    try {
      final response = await api.post('${EndPoint.baseUrl}signin', data: {
        ApiKeys.email: signInEmail.text,
        ApiKeys.password: signInPassword.text
      });
      final user = SignInModel.fromJson(response);

      emit(SignInSuccess());
      debugPrint(response.data);
    } catch (e) {
      emit(SignInFailure(errMessage: e.toString()));
    }
  }
}
