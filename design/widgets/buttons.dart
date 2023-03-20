import 'package:flutter/material.dart';

import '../custom_theme.dart';

class CustomFilledButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  final Function onTap;
  final bool? circular;
  const CustomFilledButton({Key? key, required this.text, this.height, this.width, required this.onTap, this.circular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 10;
    if (circular == true && height!=null){
      radius = height!;
    }
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: CustomAppTheme.mainColor,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [CustomAppTheme.mainShadow]
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: CustomAppTheme.mainFont,
                fontSize: 20
              ),
            ),
          ),
        )
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  final Function? onTap;
  const CustomBackButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
        if(onTap != null){
          onTap!();
        }
      },
      child: Icon(
        Icons.arrow_back,
        color: CustomAppTheme.mainTextColor,
        size: 30,
      ),
    );
  }
}