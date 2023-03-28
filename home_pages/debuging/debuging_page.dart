import 'package:flutter/material.dart';
import 'package:ntv3_cluster/design/custom_theme.dart';
import 'package:ntv3_cluster/design/widgets/custim_containers.dart';
import 'package:ntv3_cluster/design/widgets/texts.dart';
import 'package:ntv3_cluster/home_pages/debuging/sensor_condition_widget.dart';
import 'package:ntv3_cluster/home_pages/viewing/viewing_requests.dart';

class DebugingPage extends StatefulWidget {
  DebugingPage({Key? key}) : super(key: key);

  @override
  State<DebugingPage> createState() => _DebugingPageState();
}

class _DebugingPageState extends State<DebugingPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: FutureBuilder<dynamic>(
        future: ViewingRequests.getCheckData(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SensorCondition(active: snapshot.data["door_magnet_on"], name: "Геркон окна"),
                SizedBox(height: 16),
                SensorCondition(active: snapshot.data["window_magnet_on"], name: "Геркон двери"),
                SizedBox(height: 16),
                SensorCondition(active: snapshot.data["pump_on"], name: "Работа помпы"),
                SizedBox(height: 16),
                SensorCondition(active: snapshot.data["fan_on"], name: "Работа вентилятора"),
                SizedBox(height: 16),
                SensorCondition(active: snapshot.data["light_on"], name: "Работа LED ленты"),
                SizedBox(height: 16),
              ],
            );
          }
          return CustomDescriptionTitleText(text: 'Ошибка');
        }
      ),
    );
  }
}