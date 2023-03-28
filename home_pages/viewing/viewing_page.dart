import 'package:flutter/material.dart';
import 'package:ntv3_cluster/design/widgets/texts.dart';
import 'package:ntv3_cluster/home_pages/viewing/viewing_requests.dart';

import 'info_widgets/doors_widget.dart';
import 'info_widgets/energy_widget.dart';
import 'info_widgets/environment.dart';
import 'info_widgets/light_widget.dart';
import 'info_widgets/robot_widget.dart';
import 'info_widgets/water_widget.dart';


class ViewingPage extends StatefulWidget {
  ViewingPage({Key? key}) : super(key: key);

  @override
  State<ViewingPage> createState() => _ViewingPageState();
}

class _ViewingPageState extends State<ViewingPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: FutureBuilder<dynamic>(
        future: ViewingRequests.getMiscData(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    RobotInfoWidget(
                      width: MediaQuery.of(context).size.width*0.5-32*2,
                    ),
                    const SizedBox(height: 16),
                    WaterInfoWidget(
                      width: MediaQuery.of(context).size.width*0.5-32*2,
                    ),
                    const SizedBox(height: 16),
                    DoorsInfoWidget(
                      width: MediaQuery.of(context).size.width*0.5-32*2,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    LightInfoWidget(
                      width: MediaQuery.of(context).size.width*0.5-32*2,
                      lightLux: snapshot.data['light_lux'],
                    ),
                    const SizedBox(height: 16),
                    EnvironmentInfoWidget(
                      temperature: snapshot.data['temperature'],
                      co2Ppm: snapshot.data['co2_ppm'],
                      humidity: snapshot.data['humidity'],
                      tvocPpm: snapshot.data['tvoc_ppm'],
                      pressure: snapshot.data['pressure'],
                      width: MediaQuery.of(context).size.width*0.5-32*2
                    ),
                    const SizedBox(height: 16),
                    EnergyInfoWidget(
                      powerage: snapshot.data['powerage'],
                      amperage: snapshot.data['amperage'],
                      width: MediaQuery.of(context).size.width*0.5-32*2
                    )
                  ],
                )
              ],
            );
          }
          else{
            return Center(child: CustomTitleText(text: 'Загрузка...'));
          }
        }
      ),
    );
  }
}