import 'package:advanced_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: "Already have an account yet? ",
            style: Styles.font12BlackNormal,
          ),
          TextSpan(
            text: "Sign Up ",
            style: Styles.font12BlueNormal,
          ),
        ]),
      ),
    );
  }
}
