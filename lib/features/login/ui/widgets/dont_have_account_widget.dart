import 'package:advanced_app/core/helpers/extension.dart';
import 'package:advanced_app/core/routing/routes.dart';
import 'package:advanced_app/core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DoNotHaveAnAccountWidget extends StatelessWidget {
  const DoNotHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: "Don't have an account yet? ",
            style: Styles.font12BlackNormal,
          ),
          TextSpan(
            text: "Sign Up ",
            style: Styles.font12BlueNormal,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.signUpScreen);
              },
          ),
        ]),
      ),
    );
  }
}
