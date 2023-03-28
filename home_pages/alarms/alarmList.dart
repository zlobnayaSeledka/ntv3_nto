import 'package:flutter/material.dart';
import 'package:ntv3_cluster/home_pages/alarms/alarm_requests.dart';
import 'package:ntv3_cluster/home_pages/alarms/alarm_widget.dart';

class AlarmList extends StatefulWidget {
  AlarmList({Key? key}) : super(key: key);

  @override
  State<AlarmList> createState() => _AlarmListState();
}

class _AlarmListState extends State<AlarmList> {
  Map alarmActive = {
    "quake": false,
    "co2": false,
    "overflow": false,
    "tvoc": false
  };
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Center(
          child: FutureBuilder<dynamic>(
            future: AlarmRequests.getAlarmList(),
            builder: (context, snapshot) {
              if (snapshot.hasData){
                alarmActive = snapshot.data;
              }
              return Column(
                children: [
                  const SizedBox(height: 8.0),
                  AlarmWidget(
                    alarmText: '!Землетрясение!', 
                    active: alarmActive['quake'],
                    onTap: (){
                      setState(() {
                        alarmActive['quake'] = false;  
                        AlarmRequests.changeAlarm('quake', false);
                      });
                    },
                  ),
                  const SizedBox(height: 8.0),
                  AlarmWidget(
                    alarmText: '!Превышение CO2!', 
                    active: alarmActive['co2'],
                    onTap: (){
                      setState(() {
                        alarmActive['co2'] = false;  
                        AlarmRequests.changeAlarm('co2', false);
                      });
                    },
                  ),
                  
                  AlarmWidget(
                    alarmText: '!Превышение ЛОС!', 
                    active: alarmActive['tvoc'],
                    onTap: (){
                      setState(() {
                        alarmActive['tvoc'] = false; 
                        AlarmRequests.changeAlarm('tvoc', false); 
                      });
                    },
                  ),
                  AlarmWidget(
                    alarmText: '!Переполнение колбы!', active: alarmActive['overflow'],
                    onTap: (){
                      setState(() {
                        alarmActive['overflow'] = false;  
                        AlarmRequests.changeAlarm('overflow', false);
                      });
                    },
                  ),
                ],
              );
            }
          )
        ),
      ],
    );
  }
}