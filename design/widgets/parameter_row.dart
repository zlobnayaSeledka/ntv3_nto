import 'package:flutter/material.dart';
import 'package:ntv3_cluster/design/widgets/custim_containers.dart';
import 'package:ntv3_cluster/design/widgets/texts.dart';

class ParameterRow extends StatelessWidget {
  final String parameterName;
  final String value;
  final double? width;
  const ParameterRow({Key? key, required this.parameterName, required this.value, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBoxWithShadow(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width,
              child: CustomMidleText(
                text: parameterName,
                size: 20,
              ),
            ),
            CustomMidleText(
              text: value,
              size: 20,
            )
          ],
        ),
      )
    );
  }
}