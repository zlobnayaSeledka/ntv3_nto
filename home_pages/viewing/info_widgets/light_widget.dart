import 'package:flutter/material.dart';
import 'package:ntv3_cluster/design/widgets/parameter_row.dart';
import '../../../design/widgets/custim_containers.dart';
import '../../../design/widgets/swith.dart';
import '../../../design/widgets/texts.dart';

class LightInfoWidget extends StatefulWidget {
  final double width;
  final int lightLux;
  const LightInfoWidget({Key? key, required this.width, required this.lightLux}) : super(key: key);

  @override
  State<LightInfoWidget> createState() => _LightInfoWidgetState();
}

class _LightInfoWidgetState extends State<LightInfoWidget> {
  bool pump = false;
  bool smartLight = false;
  @override
  Widget build(BuildContext context) {
    return CustomBoxWithShadow(
      width: widget.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTitleText(
              text: 'Освещение',
              size: 25,
            ),
            const SizedBox(height: 16),
            CustomSwitchWidget(
              name: 'Включить умное освещение', 
              onTap: (value){
                setState(() {
                  smartLight = value;
                });
              }
            ),
            const SizedBox(height: 16),
            CustomSwitchWidget(
              name: 'Свет', 
              active: !smartLight,
              onTap: (val){}
            ),
            const SizedBox(height: 16),
            ParameterRow(
              parameterName: 'Показатели освещённости', 
              value: '${widget.lightLux.toInt()} lx',
              width: widget.width-120,
            ),
          ],
        ),
      )
    );
  }
}