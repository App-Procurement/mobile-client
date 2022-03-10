// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// class graph extends StatelessWidget {
//   const graph({Key? key}) : super(key: key);
  

//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<Sales, String>> _createRandomData() {
//       final random = Random();
//       final desktopSalesData = [
//         Sales(
//           year: 'jan',
//           sales: random.nextInt(100),
//         ),
//         Sales(
//           year: 'feb',
//           sales: random.nextInt(100),
//         ),
//         Sales(
//           year: 'mar',
//           sales: random.nextInt(100),
//         ),
//         Sales(
//           year: 'apr',
//           sales: random.nextInt(100),
//         ),
//         Sales(
//           year: 'may',
//           sales: random.nextInt(100),
//         ),
//         Sales(
//           year: 'jun',
//           sales: random.nextInt(100),
//         ),
//         Sales(
//           year: 'jul',
//           sales: random.nextInt(100),
//         ),
//       ];
//       final mobileSalesData = [
//         Sales(
//           year: 'jan',
//           sales: random.nextInt(100),
//         ),
//         Sales(
//           year: 'feb',
//           sales: random.nextInt(100),
//         ),
//         Sales(
//           year: 'mar',
//           sales: random.nextInt(100),
//         ),
//         Sales(
//           year: 'apr',
//           sales: random.nextInt(100),
//         ),
//         Sales(
//           year: 'may',
//           sales: random.nextInt(100),
//         ),
//         Sales(
//           year: 'jun',
//           sales: random.nextInt(100),
//         ),
//         Sales(
//           year: 'jul',
//           sales: random.nextInt(100),
//         ),
//       ];

//       return [
//         charts.Series<Sales, String>(
//           id: 'Sales',
//           domainFn: (Sales sales, _) => sales.year,
//           measureFn: (Sales sales, _) => sales.sales,
//           data: desktopSalesData,
//           fillColorFn: (Sales sales, _) {
//             return charts.MaterialPalette.purple.shadeDefault;
//           },
//         ),
//         charts.Series<Sales, String>(
//           id: 'Sales',
//           domainFn: (Sales sales, _) => sales.year,
//           measureFn: (Sales sales, _) => sales.sales,
//           data: mobileSalesData,
//           fillColorFn: (Sales sales, _) {
//             return charts.MaterialPalette.red.shadeDefault;
//           },
//         )
//       ];

//       // return CircularProgressIndicator();
//     }
//     return CircularProgressIndicator();
//   }
// }

// // late final List<charts.Series<dynamic, String>> seriesList;

// class Sales {
//   final String year;
//   final int sales;

//   Sales({
//     required this.year,
//     required this.sales,
//   });
// }
