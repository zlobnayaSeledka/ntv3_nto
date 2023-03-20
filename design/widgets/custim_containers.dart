import 'package:flutter/material.dart';

import '../custom_theme.dart';

class CustomBoxWithShadow extends StatelessWidget {
  final double? height;
  final double? width;
  final int? animation;
  final Widget child;
  const CustomBoxWithShadow({Key? key, this.width, this.height, this.animation, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return animation==null?Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [CustomAppTheme.mainShadow],
        color: CustomAppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(CustomAppTheme.mainBorderRadius)
      ),
      child: child,
    ):
    AnimatedContainer(
      duration: Duration(milliseconds: animation!),
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [CustomAppTheme.mainShadow],
        color: CustomAppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(CustomAppTheme.mainBorderRadius)
      ),
      child: child,
    );
  }
}