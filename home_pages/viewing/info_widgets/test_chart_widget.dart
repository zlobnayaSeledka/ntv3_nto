// import 'package:charts_flutter/flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:ntv3_cluster/design/widgets/custim_containers.dart';
// import 'package:ntv3_cluster/models/chart_data.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// class ChartWidget extends StatelessWidget {
//   const ChartWidget({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     List<ChartData> data = [
//       ChartData(1, 100),
//       ChartData(2, 250),
//       ChartData(3, 150),
//       ChartData(4, 70),
//       ChartData(5, 200),
//     ];
//     List<Series<dynamic, dynamic>> series = [
//       charts.Series(
//         id: "developers",
//         data: data,
//         domainFn: (series, _) => series.time,
//         measureFn: (series, _) => series.value,
//         colorFn: (series, _) => charts.ColorUtil.fromDartColor(Colors.green)
//       )
//     ];
//     return CustomBoxWithShadow(
//       width: 300,
//       height: 300,
//       child: charts.LineChart(series,
//            domainAxis: const charts.NumericAxisSpec(
//                  tickProviderSpec:
//                  charts.BasicNumericTickProviderSpec(zeroBound: false),
//                  viewport: charts.NumericExtents(2016.0, 2022.0),
//            ),
//            animate: true),
//     );
//   }
// }