import 'package:flutter/material.dart';
import 'package:ntv3_cluster/authorization/authorization_requests.dart';
import 'package:ntv3_cluster/design/custom_theme.dart';
import 'package:ntv3_cluster/design/widgets/texts.dart';
import 'package:ntv3_cluster/home_pages/viewing/viewing_requests.dart';

import 'custim_containers.dart';

class CustomSwitchWidget extends StatefulWidget {
  final Function onTap;
  final String name;
  final bool? active;
  const CustomSwitchWidget({Key? key, required this.name, required this.onTap, this.active}) : super(key: key);

  @override
  State<CustomSwitchWidget> createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  bool pump = false;
  @override
  Widget build(BuildContext context) {
    return CustomBoxWithShadow(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<dynamic>(
          future: RequestsAuthorization.isLogined(),
          builder: (context, snap){
            
            if (snap.hasData){
              String changingName = '';
            switch (widget.name) {
              case 'Сервопривод дверь':
                changingName = 'door_open';
                break;
              case 'Сервопривод окно':
                changingName = 'window_open';
                break;
              case 'Помпа':
                changingName = 'pump_on';
                break;
              case 'Вентиляторы':
                changingName = 'fan_on';
                break;
              case 'Свет':
                changingName = 'light_on';
                break;
              case 'Включить умное освещение':
                changingName = 'auto_lighting_on';
                break;
              default: changingName = '';
              
            }
            
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  snap.data == true && widget.active != false?CustomMidleText(
                    text: widget.name,
                    size: 20,
                  ):
                  CustomDescriptionText(
                    text: widget.name,
                    size: 20,
                  ),
                  FutureBuilder<dynamic>(
                    future: ViewingRequests.getLabCtl(),
                    builder: (context, snapshot2) {
                      if (snapshot2.hasData){
                        //print(widget.name+snapshot2.data[changingName].toString());
                        return Switch(
                          focusColor: CustomAppTheme.secondColor,
                          activeColor: CustomAppTheme.secondColor,
                          value: snapshot2.data[changingName], 
                          onChanged: (value){
                            if (snap.data == true && widget.active != false){
                              setState(() {
                                pump = value;
                                widget.onTap(value);
                                
                                ViewingRequests.changeLabCtl(changingName, value);
                              });
                            }
                          }
                        );
                      }
                      return Container();
                    }
                  )
                ],
              );
            }
            return Container();
          }
        ),
      ),
    );
  }
}