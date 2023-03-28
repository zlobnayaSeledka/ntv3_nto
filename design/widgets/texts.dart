import 'package:flutter/material.dart';

import '../custom_theme.dart';

class CustomLinkText extends StatelessWidget {
  final String text;
  final double? size;
  const CustomLinkText({Key? key, required this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: CustomAppTheme.secondColor,
        fontSize: size,
        fontWeight: FontWeight.w600,
        fontFamily: CustomAppTheme.mainFont,
        decoration: TextDecoration.none
      ),
    );
  }
}

class CustomTitleText extends StatelessWidget {
  final String text;
  final double? size;
  const CustomTitleText({Key? key, required this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: CustomAppTheme.mainTextColor,
        fontSize: size,
        fontWeight: FontWeight.bold,
        fontFamily: CustomAppTheme.mainFontBold,
        decoration: TextDecoration.none
      ),
    );
  }
}

class CustomDescriptionTitleText extends StatelessWidget {
  final String text;
  final double? size;
  const CustomDescriptionTitleText({Key? key, required this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: CustomAppTheme.descriptionTextColor,
        fontSize: size,
        fontWeight: FontWeight.bold,
        fontFamily: CustomAppTheme.mainFontBold,
        decoration: TextDecoration.none,
      ),
    );
  }
}

class CustomDescriptionText extends StatelessWidget {
  final String text;
  final double? size;
  const CustomDescriptionText({Key? key, required this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: CustomAppTheme.descriptionTextColor,
        fontSize: size,
        decoration: TextDecoration.none
      ),
    );
  }
}

class CustomMidleText extends StatelessWidget {
  final String text;
  final double? size;
  const CustomMidleText({Key? key, required this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      softWrap: false,
      overflow: TextOverflow.fade,
      style: TextStyle(
        color: CustomAppTheme.mainTextColor,
        fontSize: size,
        fontWeight: FontWeight.w600,
        fontFamily: CustomAppTheme.mainFont,
        decoration: TextDecoration.none
      ),
    );
  }
} 


class CustomErrorText extends StatelessWidget {
  final String text;
  final double? size;
  const CustomErrorText({Key? key, this.size, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: CustomAppTheme.errorColor,
        decoration: TextDecoration.none,
        fontFamily: CustomAppTheme.mainFontLight
      ),
    );
  }
}