import 'package:flutter/material.dart';
import 'package:ntv3_cluster/design/custom_theme.dart';
import 'package:ntv3_cluster/design/widgets/custim_containers.dart';
import 'package:ntv3_cluster/design/widgets/texts.dart';

class AlarmWidget extends StatelessWidget {
  final String alarmText;
  final bool active;
  final Function onTap;
  const AlarmWidget({Key? key, required this.alarmText, required this.active, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: active,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
          width: 500,//MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(CustomAppTheme.mainBorderRadius),
            boxShadow: [
              BoxShadow(
                color: CustomAppTheme.errorColor,
                spreadRadius: 1,
                blurRadius: 4
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 30,
                ),
                CustomTitleText(
                  text: alarmText,
                  size: 17,
                ),
                IconButton(
                  onPressed: (){
                    onTap();
                  }, 
                  icon: Icon(
                    Icons.close,
                    color: CustomAppTheme.descriptionTextColor,
                    size: 15,
                  )
                )
              ],
            ),
          ), 
        ),
      ),
    );
  }
}
