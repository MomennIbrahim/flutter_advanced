import 'package:advanced_app/core/theming/colors.dart';
import 'package:advanced_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({super.key, required this.textName});

  final String textName;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(ColorsManger.mainBlue),
        overlayColor: WidgetStateProperty.all(ColorsManger.lighterGrey),
        fixedSize: WidgetStateProperty.all(Size(double.infinity, 30.h)),
        textStyle: WidgetStateProperty.all(Styles.font14BlueNormal),
      ),
      onPressed: () {},
      child: Text(textName),
    );
  }
}
