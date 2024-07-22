import 'package:advanced_app/core/helpers/spacing.dart';
import 'package:advanced_app/core/theming/styles.dart';
import 'package:advanced_app/core/widgets/app_button.dart';
import 'package:advanced_app/core/widgets/app_text_button.dart';
import 'package:advanced_app/features/login/ui/widgets/terms_and_condition_widget.dart';
import 'package:advanced_app/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:advanced_app/features/sign_up/ui/widgets/have_already_account.dart';
import 'package:advanced_app/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:advanced_app/features/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: Styles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                  style: Styles.font14GreyNormal,
                ),
                verticalSpace(36),
                const SignUpForm(),
                verticalSpace(10),
                const Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: AppTextButton(
                    textName: 'Forgot Password',
                  ),
                ),
                verticalSpace(35),
                AppButton(
                  text: 'Sign Up',
                  onPressed: () {
                    validateThenDoSignUp(context);
                  },
                ),
                verticalSpace(20),
                const TermsAndConditionWidget(),
                verticalSpace(60),
                const AlreadyHaveAccountText(),
                const SignupBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignUp(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUpStates();
    }
  }
}
