import 'package:flutter/material.dart';
import 'package:ntv3_cluster/design/widgets/parameter_row.dart';
import 'package:ntv3_cluster/design/widgets/swith.dart';
import 'package:ntv3_cluster/home_pages/viewing/viewing_requests.dart';

import '../../../design/widgets/custim_containers.dart';
import '../../../design/widgets/texts.dart';

class DoorsInfoWidget extends StatefulWidget {
  final double width;
  const DoorsInfoWidget({Key? key, required this.width}) : super(key: key);

  @override
  State<DoorsInfoWidget> createState() => _DoorsInfoWidgetState();
}

class _DoorsInfoWidgetState extends State<DoorsInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomBoxWithShadow(
      width: widget.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<dynamic>(
          future: ViewingRequests.getCheckData(),
          builder: (context, snapshot){
            if (snapshot.hasData){
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTitleText(
                  text: 'Двери',
                  size: 25,
                ),
                const SizedBox(height: 16),
                CustomSwitchWidget(
                  name: 'Сервопривод дверь', 
                  onTap: (val){}
                ),
                const SizedBox(height: 16),
                ParameterRow(
                  parameterName: 'Геркон', 
                  value: snapshot.data['door_magnet_on']?'Открыто':'Закрыто',
                  width: widget.width-140,
                ),  
                const SizedBox(height: 16),
                const CustomTitleText(
                  text: 'Окна',
                  size: 25,
                ),
                const SizedBox(height: 16),
                CustomSwitchWidget(
                  name: 'Сервопривод окно', 
                  onTap: (val){}
                ),
                const SizedBox(height: 16),
                ParameterRow(
                  parameterName: 'Геркон', 
                  value: snapshot.data['window_magnet_on']?'Открыто':'Закрыто',
                  width: widget.width-160,
                ),
                
              ],
            );
            }
            return Center(
              child: CustomDescriptionTitleText(text: 'Ошибка при загрузке'),
            );
          }
        ),
      )
    );
  }
}