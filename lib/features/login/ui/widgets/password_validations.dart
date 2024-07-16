import 'package:advanced_app/core/helpers/spacing.dart';
import 'package:advanced_app/core/theming/colors.dart';
import 'package:advanced_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNumber;
  final bool hasSpecialChar;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasNumber,
    required this.hasSpecialChar,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow("At least 1 lowercase letter", hasLowerCase),
        verticalSpace(2),
        buildValidationRow("At least 1 uppercase letter", hasUpperCase),
        verticalSpace(2),
        buildValidationRow("At least 1 number letter", hasNumber),
        verticalSpace(2),
        buildValidationRow("At least 1 special char letter", hasSpecialChar),
        verticalSpace(2),
        buildValidationRow("At least 8 length letter", hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: ColorsManger.grey,
          radius: 2.5,
        ),
        horizontalSpace(6),
        Text(text,
            style: Styles.font14DarkBlueMedium.copyWith(
              decoration: hasValidated ? TextDecoration.lineThrough : null,
              decorationColor: Colors.green,
              decorationThickness: 2,
              color: hasValidated ? ColorsManger.grey : ColorsManger.darkBlue,
            )),
      ],
    );
  }
}
