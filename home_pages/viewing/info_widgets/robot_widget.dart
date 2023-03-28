import 'package:flutter/material.dart';
import 'package:ntv3_cluster/home_pages/viewing/viewing_requests.dart';

import '../../../design/custom_theme.dart';
import '../../../design/widgets/custim_containers.dart';
import '../../../design/widgets/texts.dart';

class RobotInfoWidget extends StatefulWidget {
  final double width;
  const RobotInfoWidget({Key? key, required this.width}) : super(key: key);

  @override
  State<RobotInfoWidget> createState() => _RobotInfoWidgetState();
}

class _RobotInfoWidgetState extends State<RobotInfoWidget> {
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
              text: 'Робот',
              size: 25,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const CustomMidleText(
                  text: 'Полученный цвет: ',
                  size: 20,
                ),
                const SizedBox(
                  width: 24,
                ),
                FutureBuilder<dynamic>(
                  future: ViewingRequests.getScannedColor(),
                  builder: (context, snapshot) {
                    return Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: snapshot.hasData?snapshot.data:CustomAppTheme.descriptionTextColor,
                        borderRadius: BorderRadius.circular(CustomAppTheme.mainBorderRadius)
                      )
                    );
                  }
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const CustomMidleText(
                  text: 'Запрошенный цвет:',
                  size: 20,
                ),
                const SizedBox(
                  width: 24,
                ),
                FutureBuilder<dynamic>(
                  future: ViewingRequests.getRequiredColor(),
                  builder: (context, snapshot) {
                    return Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: snapshot.hasData?snapshot.data:CustomAppTheme.descriptionTextColor,
                        borderRadius: BorderRadius.circular(CustomAppTheme.mainBorderRadius)
                      )
                    );
                  }
                )
              ],
            )
          ],
        ),
      )
    );
  }
}