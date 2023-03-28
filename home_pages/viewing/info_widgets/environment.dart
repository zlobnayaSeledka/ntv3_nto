import 'package:flutter/material.dart';
import 'package:ntv3_cluster/design/widgets/parameter_row.dart';
import 'package:ntv3_cluster/design/widgets/swith.dart';
import '../../../design/widgets/custim_containers.dart';
import '../../../design/widgets/texts.dart';

class EnvironmentInfoWidget extends StatefulWidget {
  final double width;
  final int co2Ppm;
  final int tvocPpm;
  final double pressure;
  final double temperature;
  final double  humidity;
  const EnvironmentInfoWidget({
      Key? key, 
      required this.width, 
      required this.co2Ppm,
      required this.humidity,
      required this.pressure,
      required this.temperature,
      required this.tvocPpm
    }) : super(key: key);

  @override
  State<EnvironmentInfoWidget> createState() => _EnvironmentInfoWidgetState();
}

class _EnvironmentInfoWidgetState extends State<EnvironmentInfoWidget> {
  bool pump = false;
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
              text: 'Окружающая среда',
              size: 25,
            ),
            const SizedBox(height: 16),
            CustomSwitchWidget(
              name: 'Вентиляторы', 
              onTap: (val){}
            ),
            const SizedBox(height: 16),
            ParameterRow(
              parameterName: 'CO2', 
              value: '${widget.co2Ppm.toInt()} ppm',
              width: widget.width-140,
            ),  
            const SizedBox(height: 16),
            ParameterRow(
              parameterName: 'Влажность', 
              value: '${widget.humidity.toInt()} %',
              width: widget.width-120,
            ),
            const SizedBox(height: 16),
            ParameterRow(
              parameterName: 'Давление', 
              value: '${widget.pressure.toInt()} Па',
              width: widget.width-180,
            ),
            const SizedBox(height: 16),
            ParameterRow(
              parameterName: 'Температура', 
              value: '${widget.temperature.toInt()} C',
              width: widget.width-120,
            ),
            const SizedBox(height: 16),
            ParameterRow(
              parameterName: 'ЛОС', 
              value: '${widget.tvocPpm.toInt()} ppm',
              width: widget.width-180,
            ),
          ],
        ),
      )
    );
  }
}