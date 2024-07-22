import 'dart:developer';

import 'package:advanced_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:advanced_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:advanced_app/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignupState> {
  final SignUpRepo _signUpRepo;

  SignUpCubit(this._signUpRepo) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmatonController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignUpStates() async {
    emit(const SignupState.signupLoading());

    final response = await _signUpRepo.signUp(
      signUpRequestBody: SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        gender: 0,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmatonController.text,
      ),
    );

    response.when(sussess: (signUpResponse) {
      log(signUpResponse.toString());
      emit(SignupState.signupSuccess(signUpResponse));
    }, failure: (error) {
      log(error.apiErrorModel.message!);
      emit(SignupState.signupError(error: error.apiErrorModel.message!));
    });
  }
}
