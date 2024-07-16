import 'package:advanced_app/core/helpers/app_regex.dart';
import 'package:advanced_app/core/helpers/spacing.dart';
import 'package:advanced_app/core/widgets/app_text_form_field.dart';
import 'package:advanced_app/features/login/logic/cubit/login_cubit.dart';
import 'package:advanced_app/features/login/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObsecure = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialChar = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;

    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    /* el addListener dh bi3mel eh ? kol ma na bktb 7aga fy el text form field bta3t el password b y listen 3liha
    / w el listener bibd2 ytb2 el regex w yshof ely na katbto dh bimatch anho regex fehom
     w ybd2 y act according l kda w 3amel set state 3shan lma el value tt8ir tsm3 m3aia w y8air kimt el boolean*/

    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasSpecialChar = AppRegex.hasSpecialCharacter(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            hintText: "Email",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return "Please a valid email";
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please a valid password";
              }
            },
          ),
          verticalSpace(10),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasMinLength: hasMinLength,
            hasUpperCase: hasUpperCase,
            hasSpecialChar: hasSpecialChar,
            hasNumber: hasNumber,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
