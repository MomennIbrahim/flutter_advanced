import 'package:advanced_app/core/helpers/spacing.dart';
import 'package:advanced_app/core/theming/styles.dart';
import 'package:advanced_app/core/widgets/app_button.dart';
import 'package:advanced_app/core/widgets/app_text_button.dart';
import 'package:advanced_app/features/login/data/models/login_request_body.dart';
import 'package:advanced_app/features/login/logic/cubit/login_cubit.dart';
import 'package:advanced_app/features/login/ui/widgets/already_have_an_account_widget.dart';
import 'package:advanced_app/features/login/ui/widgets/emal_and_password.dart';
import 'package:advanced_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:advanced_app/features/login/ui/widgets/terms_and_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: Styles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: Styles.font14GreyNormal,
                ),
                verticalSpace(36),
                const EmailAndPassword(),
                verticalSpace(10),
                const Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: AppTextButton(
                    textName: 'Forgot Password',
                  ),
                ),
                verticalSpace(35),
                AppButton(
                  text: 'Login',
                  onPressed: () {
                    validateThenDoLogin(context);
                  },
                ),
                verticalSpace(20),
                const TermsAndConditionWidget(),
                verticalSpace(60),
                const AlreadyHaveAnAccountWidget(),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState(
              // loginRequestBody m7taga mny new instance mn el LoginRequestBody();
              loginRequestBody: LoginRequestBody(
            email: context.read<LoginCubit>().emailController.text,
            password: context.read<LoginCubit>().passwordController.text,
          ));
    }
  }
}
