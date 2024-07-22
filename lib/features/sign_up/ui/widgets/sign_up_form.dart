import 'package:advanced_app/core/helpers/app_regex.dart';
import 'package:advanced_app/core/helpers/spacing.dart';
import 'package:advanced_app/core/widgets/app_text_form_field.dart';
import 'package:advanced_app/features/login/ui/widgets/password_validations.dart';
import 'package:advanced_app/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpForm> {
  bool isPassObsecure = true;
  bool isConfirmPassObsecure = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialChar = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;

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
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignUpCubit>().nameController,
            hintText: "Name",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please a valid name";
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<SignUpCubit>().emailController,
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
            controller: context.read<SignUpCubit>().phoneController,
            keyboardType: TextInputType.phone,
            hintText: "Phone",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return "Please a valid phone";
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "Password",
            obsecureText: isPassObsecure,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPassObsecure = !isPassObsecure;
                });
              },
              child: Icon(
                isPassObsecure ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please a valid password";
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller:
                context.read<SignUpCubit>().passwordConfirmatonController,
            hintText: "Confrim Password",
            obsecureText: isConfirmPassObsecure,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isConfirmPassObsecure = !isConfirmPassObsecure;
                });
              },
              child: Icon(
                isConfirmPassObsecure ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid password";
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
