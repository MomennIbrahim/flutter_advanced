import 'package:advanced_app/core/theming/colors.dart';
import 'package:advanced_app/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  static TextStyle font12GreyNormal = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.normal,
    color: ColorsManger.grey,
  );
  static TextStyle font12BlackNormal = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.normal,
    color: Colors.black,
  );
  static TextStyle font12BlueNormal = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.normal,
    color: ColorsManger.mainBlue,
  );
  static TextStyle font14BlueNormal = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.normal,
    color: ColorsManger.mainBlue,
  );

  static TextStyle font13GreyNormal = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.normal,
    color: ColorsManger.grey,
  );

  static TextStyle font14GreyNormal = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.normal,
    color: ColorsManger.grey,
  );
  static TextStyle font14GreyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManger.lightGrey,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManger.darkBlue,
  );

    static TextStyle font14DarkBlueSemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManger.darkBlue,
  );

    static TextStyle font15DarkBlueMedium = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManger.darkBlue,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );

  static TextStyle font24BlueBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManger.mainBlue,
  );

  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle font32MainBlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManger.mainBlue,
  );
}
