import 'package:flutter/material.dart';
import 'package:ntv3_cluster/design/widgets/parameter_row.dart';
import 'package:ntv3_cluster/design/widgets/swith.dart';
import '../../../design/widgets/custim_containers.dart';
import '../../../design/widgets/texts.dart';

class EnergyInfoWidget extends StatefulWidget {
  final double width;
  final double powerage;
  final double amperage;
  const EnergyInfoWidget({Key? key, required this.width, required this.amperage, required this.powerage}) : super(key: key);

  @override
  State<EnergyInfoWidget> createState() => _EnergyInfoWidgetState();
}

class _EnergyInfoWidgetState extends State<EnergyInfoWidget> {
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
              text: 'Электричество',
              size: 25,
            ),
            const SizedBox(height: 16),
            ParameterRow(
              parameterName: 'Мощность', 
              value: '${widget.powerage.toInt().abs()} мВт',
              width: widget.width-140,
            ),  
            const SizedBox(height: 16),
            ParameterRow(
              parameterName: 'Показатели датчика тока', 
              value: '${(widget.amperage.toInt().abs())} мA',
              width: widget.width-120,
            ),
            
          ],
        ),
      )
    );
  }
}