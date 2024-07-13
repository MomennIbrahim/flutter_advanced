import 'package:advanced_app/core/helpers/spacing.dart';
import 'package:advanced_app/core/theming/styles.dart';
import 'package:advanced_app/core/widgets/app_button.dart';
import 'package:advanced_app/core/widgets/app_text_button.dart';
import 'package:advanced_app/core/widgets/app_text_form_field.dart';
import 'package:advanced_app/features/login/ui/widgets/already_have_an_account_widget.dart';
import 'package:advanced_app/features/login/ui/widgets/terms_and_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObsecure = true;

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
                Form(
                    child: Column(
                  children: [
                    const AppTextFormField(hintText: "Email"),
                    verticalSpace(16),
                    AppTextFormField(
                      hintText: "Password",
                      obsecureText: isObsecure,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObsecure = !isObsecure;
                          });
                        },
                        child: Icon(
                          isObsecure ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                    ),
                  ],
                )),
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
                  onPressed: () {},
                ),
                verticalSpace(20),
                const TermsAndConditionWidget(),
                verticalSpace(60),
                const AlreadyHaveAnAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
