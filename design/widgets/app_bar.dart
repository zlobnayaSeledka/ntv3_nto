import 'package:flutter/material.dart';

import 'buttons.dart';
import 'texts.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? left;
  final Widget? right;
  final bool backBotton;
  final String? title;
  const CustomAppBar({Key? key, this.left, this.right, required this.backBotton, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              backBotton?const CustomBackButton():left == null?Container():left!,
              title == null && left != Container()?const SizedBox(width: 16):Container(),
              title != null?Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomTitleText(text: title!, size: 25),
              ):Container(),
            ]
          ),
          right == null?Container():right!
        ],
      ),
    );
  }
}