import 'package:advanced_app/core/theming/styles.dart';
import 'package:advanced_app/features/onboarding/widgets/doc_image_and_text.dart';
import 'package:advanced_app/features/onboarding/widgets/doc_logo_and_name.dart';
import 'package:advanced_app/features/onboarding/widgets/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30.h,
              bottom: 30.h,
            ),
            child: Column(
              children: [
                const DocLogoAndName(),
                SizedBox(
                  height: 30.h,
                ),
                const DocImageAndText(),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                    style: Styles.font13GreyW400,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                const GetStartedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
