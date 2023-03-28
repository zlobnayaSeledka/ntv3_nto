import 'package:flutter/material.dart';

import '../../design/custom_theme.dart';
import '../../design/widgets/custim_containers.dart';
import '../../design/widgets/texts.dart';

class SensorCondition extends StatelessWidget {
  final bool active;
  final String name;
  const SensorCondition({Key? key, required this.active, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBoxWithShadow(
      width: MediaQuery.of(context).size.width*0.5-32*2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTitleText(
              text: name,
              size: 20,
            ),
            Container(
              width: 20,
              height: 20,
              decoration: active? BoxDecoration(
                color: CustomAppTheme.mainColor,
                boxShadow: [
                  BoxShadow(
                    color: CustomAppTheme.mainColor,
                    blurRadius: 2,
                    spreadRadius: 1
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ):BoxDecoration(
                color: CustomAppTheme.descriptionTextColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: CustomAppTheme.descriptionTextColor,
                  width: 2
                )
              ),
            )
          ],
        ),
      )
    );
  }
}