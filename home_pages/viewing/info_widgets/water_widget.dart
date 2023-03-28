import 'package:flutter/material.dart';
import 'package:ntv3_cluster/design/widgets/parameter_row.dart';
import 'package:ntv3_cluster/home_pages/viewing/viewing_requests.dart';
import '../../../design/widgets/custim_containers.dart';
import '../../../design/widgets/swith.dart';
import '../../../design/widgets/texts.dart';

class WaterInfoWidget extends StatefulWidget {
  final double width;
  const WaterInfoWidget({Key? key, 
    required this.width, 
  }) : super(key: key);

  @override
  State<WaterInfoWidget> createState() => _WaterInfoWidgetState();
}

class _WaterInfoWidgetState extends State<WaterInfoWidget> {
  bool pump = false;
  @override
  Widget build(BuildContext context) {
    return CustomBoxWithShadow(
      width: widget.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<dynamic>(
          future: ViewingRequests.getWaterData(),
          builder: (context, snapshot) {
            if (snapshot.hasData){
              double colb1Volume = snapshot.data['colb1_volume'];
              double colb2Volume = snapshot.data['colb2_volume'];
              double flowedVolume = snapshot.data['flowed_volume'];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTitleText(
                    text: 'Жидкость',
                    size: 25,
                  ),
                  const SizedBox(height: 16),
                  CustomSwitchWidget(
                    name: 'Помпа', 
                    onTap: (val){}
                  ),
                  const SizedBox(height: 16),
                  ParameterRow(
                    
                    //   flowedVolume: snapshot.data['flowedVolume'],
                    //   colb1Volume: snapshot.data['colb1_volume'],
                    //   colb2Volume: snapshot.data['colb2_volume'],
                    parameterName: 'Объём в полученной колбе', // датчик расстояния 
                    value: '${colb1Volume.toInt()} мл',
                    width: widget.width-150,
                  ),
                  const SizedBox(height: 16),
                  ParameterRow(
                    parameterName: 'Объём перекачанной жидкости',//'Показатели датчика потока', 
                    value: '${colb2Volume.toInt()} мл',
                    width: widget.width-150,
                  ),
                  const SizedBox(height: 16),
                  ParameterRow(
                    parameterName: 'Объём в 2-ой колбе', // датчик протечки 
                    value: '${flowedVolume.toInt()} мл',
                    width: widget.width-150,
                  )
                ],
              );
            }
            return const Center(
              child: CustomDescriptionTitleText(text: 'Ошибка при загружке',),
            );
          },
        )       
      )
    );
  }
}