import 'package:advanced_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  static TextStyle font13GreyW400 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManger.grey,
  );

  static TextStyle font16WhiteW600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle font24BlackW700 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static TextStyle font32MainBlueW700 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManger.mainBlue,
  );
}
