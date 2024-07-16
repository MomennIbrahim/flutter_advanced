import 'package:advanced_app/core/theming/colors.dart';
import 'package:advanced_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final String hintText;
  final Widget? suffixIcon;
  final bool? obsecureText;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errordBorder;
  final InputBorder? focusedErrorBorder;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String? value) validator;

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.obsecureText,
    this.enabledBorder,
    this.focusedBorder,
    this.hintStyle,
    this.contentPadding,
    this.keyboardType,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.errordBorder,
    this.focusedErrorBorder,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      style: Styles.font14DarkBlueMedium,
      decoration: InputDecoration(
        fillColor: backgroundColor ?? ColorsManger.moreLightGrey,
        filled: true,
        isDense: true,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  const BorderSide(color: ColorsManger.lighterGrey, width: 1.3),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: ColorsManger.mainBlue),
            ),
        errorBorder: errordBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red),
            ),
        focusedErrorBorder: focusedErrorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red),
            ),
        hintStyle: hintStyle ?? Styles.font14GreyMedium,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      validator: (value) {
        return validator(value);
      },
    );
  }
}
