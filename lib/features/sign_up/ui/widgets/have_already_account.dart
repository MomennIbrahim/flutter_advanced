import 'package:advanced_app/core/helpers/extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account?',
              style: Styles.font14DarkBlueMedium,
            ),
            TextSpan(
              text: ' Sipn Uo',
              style: Styles.font14BlueNormal,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushReplacementNamed(Routes.loginScreen);
                },
            ),
          ],
        ),
      ),
    );
  }
}
