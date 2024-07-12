import 'package:advanced_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
            text: "By logging, you agree to our ",
            style: Styles.font12GreyNormal),
        TextSpan(text: "Terms & Conditions ", style: Styles.font12BlackNormal),
        TextSpan(text: "and ", style: Styles.font12GreyNormal),
        TextSpan(
            text: "PrivacyPolicy ",
            style: Styles.font12BlackNormal.copyWith(height: 1.5.h)),
      ]),
    );
  }
}
