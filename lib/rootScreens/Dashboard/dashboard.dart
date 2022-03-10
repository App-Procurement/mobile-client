import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:procurementapp/color.dart' as color;
import 'package:procurementapp/graph.dart' as graph;
import 'package:procurementapp/rootScreens/common.dart';
import 'package:procurementapp/rootScreens/profile.dart';
import 'package:procurementapp/rootScreens/common.dart';

class DashBord extends StatefulWidget {
  DashBord({Key? key}) : super(key: key);

  @override
  State<DashBord> createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  // late List<charts.Series> seriesList;
  late final List<charts.Series<dynamic, String>> seriesList;
  late final List<charts.Series<dynamic, int>> pielist;

  static List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();
    final desktopSalesData = [
      Sales(
        year: 'jan',
        sales: random.nextInt(100),
      ),
      Sales(
        year: 'feb',
        sales: random.nextInt(100),
      ),
      Sales(
        year: 'mar',
        sales: random.nextInt(100),
      ),
      Sales(
        year: 'apr',
        sales: random.nextInt(100),
      ),
      Sales(
        year: 'may',
        sales: random.nextInt(100),
      ),
      Sales(
        year: 'jun',
        sales: random.nextInt(100),
      ),
      Sales(
        year: 'jul',
        sales: random.nextInt(100),
      ),
    ];
    final mobileSalesData = [
      Sales(
        year: 'jan',
        sales: random.nextInt(100),
      ),
      Sales(
        year: 'feb',
        sales: random.nextInt(100),
      ),
      Sales(
        year: 'mar',
        sales: random.nextInt(100),
      ),
      Sales(
        year: 'apr',
        sales: random.nextInt(100),
      ),
      Sales(
        year: 'may',
        sales: random.nextInt(100),
      ),
      Sales(
        year: 'jun',
        sales: random.nextInt(100),
      ),
      Sales(
        year: 'jul',
        sales: random.nextInt(100),
      ),
    ];

    return [
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: desktopSalesData,
        fillColorFn: (Sales sales, _) {
          return charts.ColorUtil.fromDartColor(color.blue4);
        },
      ),
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: mobileSalesData,
        fillColorFn: (Sales sales, _) {
          return charts.ColorUtil.fromDartColor(color.red1);
        },
      )
    ];
  }

  bar_DropDawn() {
    DropdownButton<String>(
      items: <String>[
        'Month',
        'Year',
      ].map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }

  static List<charts.Series<piesales, int>> _createSampleData() {
    final data = [
      piesales(
        0,
        80,
      ),
      piesales(1, 20),
    ];

    return [
      charts.Series<piesales, int>(
        id: 'Sales',
        domainFn: (piesales sales, _) => sales.year,
        measureFn: (piesales sales, _) => sales.sales,
        labelAccessorFn: (piesales row, _) => '${row.sales}',
        fillColorFn: (piesales sales, _) {
          return charts.MaterialPalette.purple.shadeDefault;
        },
        // labelAccessorFn: (piesales sales, _) => sales.year.toString(),
        data: data,
      )
    ];
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
    pielist = _createSampleData();
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
    );
  }

  pieChart() {
    return charts.PieChart(
      pielist,
      animate: true,
      defaultRenderer: charts.ArcRendererConfig(arcWidth: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Common().bottomAppbar(context),
        body: SingleChildScrollView(
            child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            //padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: <Widget>[
                Common().userProfile(context),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: const Text("My Dashboard",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: color.blue1,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Card(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 15.0, right: 7.0),
                                    padding: const EdgeInsets.all(15.0),
                                    decoration: const BoxDecoration(
                                      color: color.perpal9,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              125, 200, 231, 0.4),
                                          spreadRadius: 1,
                                          blurRadius: 20,
                                          offset: Offset(5, 5),
                                        )
                                      ],
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/todays-rfp-box.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 120,
                                              margin: const EdgeInsets.only(
                                                  top: 70),
                                              child: const Text(
                                                "Today's RFP",
                                                style: TextStyle(
                                                  color: color.blue1,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 120,
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: const Text(
                                                "86",
                                                style: TextStyle(
                                                  color: color.blue1,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 7.0),
                                    padding: const EdgeInsets.all(15.0),
                                    decoration: const BoxDecoration(
                                      color: color.red1,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              231, 125, 125, 0.4),
                                          spreadRadius: 1,
                                          blurRadius: 20,
                                          offset: Offset(5, 5),
                                        )
                                      ],
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/invoices-box.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 120,
                                              margin: const EdgeInsets.only(
                                                  top: 40),
                                              child: const Text(
                                                "Invoices",
                                                style: TextStyle(
                                                  color: color.backgroundColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 120,
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: const Text(
                                                "15",
                                                style: TextStyle(
                                                  color: color.backgroundColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Card(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 15.0, left: 7.0),
                                    padding: const EdgeInsets.all(15.0),
                                    decoration: const BoxDecoration(
                                      color: color.perpal3,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              125, 136, 231, 0.4),
                                          spreadRadius: 1,
                                          blurRadius: 20,
                                          offset: Offset(5, 5),
                                        )
                                      ],
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/pending-rfp-box.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 120,
                                              margin: const EdgeInsets.only(
                                                  top: 40),
                                              child: const Text(
                                                "Pending RFP",
                                                style: TextStyle(
                                                  color: color.backgroundColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 120,
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: const Text(
                                                "15",
                                                style: TextStyle(
                                                  color: color.backgroundColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 7.0),
                                    padding: const EdgeInsets.all(15.0),
                                    decoration: const BoxDecoration(
                                      color: color.green1,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              129, 232, 158, 0.4),
                                          spreadRadius: 1,
                                          blurRadius: 20,
                                          offset: Offset(5, 5),
                                        )
                                      ],
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/total-spend-box.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 120,
                                              margin: const EdgeInsets.only(
                                                  top: 70),
                                              child: const Text(
                                                "Total Spend",
                                                style: TextStyle(
                                                  color: color.blue1,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 120,
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: const Text(
                                                "67",
                                                style: TextStyle(
                                                  color: color.blue1,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(bottom: 20.0, top: 40.0),
                  child: const Text(
                    "Requisition Spend Overview",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: color.blue1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 15.0, bottom: 20.0, right: 15.0, left: 15.0),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: color.grey4,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Card(
                                          elevation: 0,
                                          color: Colors.transparent,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: 12,
                                                height: 12,
                                                margin: const EdgeInsets.only(
                                                    right: 5.0),
                                                child: const CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor:
                                                      Colors.orange,
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: const Text(
                                                  'Total Unpaid',
                                                  style: TextStyle(
                                                    color: color.blue1,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Card(
                                          elevation: 0,
                                          color: Colors.transparent,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: 12,
                                                height: 12,
                                                margin: const EdgeInsets.only(
                                                    right: 5.0),
                                                child: const CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor:
                                                      Colors.purple,
                                                ),
                                              ),
                                              Container(
                                                child: const Text(
                                                  'Total Paid',
                                                  style: TextStyle(
                                                    color: color.blue1,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  child: Container(
                                      height: 25,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: color.blue1,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Monthly',
                                            style: TextStyle(
                                              color: color.blue4,
                                              fontSize: 9,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: color.blue4,
                                            size: 17,
                                          )
                                        ],
                                      )),
                                  onTap: () => bar_DropDawn(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 300,
                        //width: MediaQuery.of(context).size.width,
                        width: 320,
                        margin: const EdgeInsets.only(top: 30.0),
                        child: barChart(),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0, top: 20.0),
                  padding: const EdgeInsets.only(
                      top: 15.0, bottom: 20.0, right: 15.0, left: 15.0),
                  decoration: const BoxDecoration(
                    color: color.grey4,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Card(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  child: Container(
                                    child: const Text(
                                      'Statistics',
                                      style: TextStyle(
                                        color: color.blue1,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      elevation: 0,
                                      color: Colors.transparent,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 14,
                                            width: 14,
                                            margin: const EdgeInsets.only(
                                                right: 8.0),
                                            decoration: BoxDecoration(
                                              color: color.backgroundColor,
                                              border: Border.all(
                                                  color: color.grey3),
                                            ),
                                          ),
                                          Container(
                                            child: const Text(
                                              'Chart',
                                              style: TextStyle(
                                                color: color.blue1,
                                                fontSize: 10,
                                                height: 1.1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Card(
                                      elevation: 0,
                                      color: Colors.transparent,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 14,
                                            width: 14,
                                            margin: const EdgeInsets.only(
                                                right: 5.0, left: 15.0),
                                            decoration: BoxDecoration(
                                              color: color.backgroundColor,
                                              border: Border.all(
                                                  color: color.blue1),
                                            ),
                                            child: Container(
                                              height: 12,
                                              width: 12,
                                              margin: const EdgeInsets.all(1.0),
                                              color: color.blue1,
                                            ),
                                          ),
                                          Container(
                                            child: const Text(
                                              'Show Value',
                                              style: TextStyle(
                                                color: color.blue1,
                                                fontSize: 10,
                                                height: 1.1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   height: 500,
                      //   width: 500,
                      //   margin: const EdgeInsets.only(bottom: 30.0),
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Column(
                      //         children: [
                      //           Card(
                      //             elevation: 0,
                      //             color: Colors.transparent,
                      //             child: Container(
                      //               width: 50,
                      //               height: 50,
                      //               child: pieChart(),
                      //               color: color.backgroundColor,
                      //             ),
                      //           ),
                      //           const Text(
                      //             'Production Parts',
                      //             style: TextStyle(
                      //               color: color.blue1,
                      //               fontSize: 10,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       Column(
                      //         children: [
                      //           Card(
                      //             elevation: 0,
                      //             color: Colors.transparent,
                      //             child: Container(
                      //               width: 50,
                      //               height: 50,
                      //               child: pieChart(),
                      //               color: color.backgroundColor,
                      //             ),
                      //           ),
                      //           const Text(
                      //             'Appliances',
                      //             style: TextStyle(
                      //               color: color.blue1,
                      //               fontSize: 10,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       Column(
                      //         children: [
                      //           Card(
                      //             elevation: 0,
                      //             color: Colors.transparent,
                      //             child: Container(
                      //               width: 50,
                      //               height: 50,
                      //               child: pieChart(),
                      //               color: color.backgroundColor,
                      //             ),
                      //           ),
                      //           const Text(
                      //             'IT & Telecom',
                      //             style: TextStyle(
                      //               color: color.blue1,
                      //               fontSize: 10,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   margin: const EdgeInsets.only(bottom: 20.0),
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Column(
                      //         children: [
                      //           Card(
                      //             elevation: 0,
                      //             color: Colors.transparent,
                      //             child: Container(
                      //               width: 50,
                      //               height: 50,
                      //               child: pieChart(),
                      //               color: color.backgroundColor,
                      //             ),
                      //           ),
                      //           const Text(
                      //             'Office Equipments',
                      //             style: TextStyle(
                      //               color: color.blue1,
                      //               fontSize: 10,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       Column(
                      //         children: [
                      //           Card(
                      //             elevation: 0,
                      //             color: Colors.transparent,
                      //             child: Container(
                      //               width: 50,
                      //               height: 50,
                      //               child: pieChart(),
                      //               color: color.backgroundColor,
                      //             ),
                      //           ),
                      //           const Text(
                      //             'Marketing',
                      //             style: TextStyle(
                      //               color: color.blue1,
                      //               fontSize: 10,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       Column(
                      //         children: [
                      //           Card(
                      //             elevation: 0,
                      //             color: Colors.transparent,
                      //             child: Container(
                      //               width: 50,
                      //               height: 50,
                      //               child: pieChart(),
                      //               color: color.backgroundColor,
                      //             ),
                      //           ),
                      //           const Text(
                      //             'Educational Supplies',
                      //             style: TextStyle(
                      //               color: color.blue1,
                      //               fontSize: 10,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(bottom: 30.0, top: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        margin: const EdgeInsets.only(left: 15.0, right: 5.0),
                        decoration: BoxDecoration(
                          color: color.perpal6,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25.0)),
                          border: Border.all(
                            color: color.perpal6,
                            width: 0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(bottom: 10.0),
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: color.perpal7,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  border: Border.all(
                                    color: color.perpal7,
                                    width: 0,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.calendar_month_outlined,
                                  color: color.backgroundColor,
                                  size: 36,
                                ),
                              ),
                            ),
                            const Text(
                              "Total PO's",
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.6,
                                fontWeight: FontWeight.bold,
                                color: color.blue1,
                              ),
                            ),
                            const Text(
                              '6 task',
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.6,
                                color: color.grey2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 140,
                        height: 140,
                        margin: const EdgeInsets.only(left: 5.0, right: 15.0),
                        decoration: BoxDecoration(
                          color: color.red2,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25.0)),
                          border: Border.all(
                            color: color.red2,
                            width: 0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(bottom: 10.0),
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: color.red1,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  border: Border.all(
                                    color: color.red1,
                                    width: 0,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.add_box,
                                  color: color.backgroundColor,
                                  size: 36,
                                ),
                              ),
                            ),
                            const Text(
                              "Pending PO's",
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.2,
                                fontWeight: FontWeight.bold,
                                color: color.blue1,
                              ),
                            ),
                            const Text(
                              '',
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.6,
                                color: color.grey2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class LinearSales {}

class Sales {
  final String year;
  final int sales;

  Sales({
    required this.year,
    required this.sales,
  });
}

class piesales {
  final int year;
  final int sales;

  piesales(this.year, this.sales);
}
