import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../custom_theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final bool? obscureText;
  final int? maxLines;
  final int? maxLength;
  final double? width;
  const CustomTextField({Key? key, 
    this.maxLength, 
    this.controller, 
    this.labelText, 
    this.obscureText, 
    this.maxLines,
    this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        boxShadow: [CustomAppTheme.mainShadow]
      ),
      child: TextField(
        maxLength: maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        textInputAction: TextInputAction.done,
        obscureText: obscureText == null || obscureText == false?false:true,
        controller: controller,
        maxLines: maxLines,
        style: TextStyle(
          fontFamily: CustomAppTheme.mainFontBold,
          color: CustomAppTheme.mainTextColor,
          fontSize: 22
        ),
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(CustomAppTheme.mainBorderRadius),
            borderSide: BorderSide.none,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(CustomAppTheme.mainBorderRadius),
            borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(CustomAppTheme.mainBorderRadius),
            borderSide: BorderSide.none
          ),
          fillColor: CustomAppTheme.backgroundColor,
          filled: true,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: CustomAppTheme.descriptionTextColor,
            fontFamily: CustomAppTheme.mainFont
          ),
          hintText: labelText,
        ),
      ),
    );
  }
}