// // ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

// import 'package:flutter/material.dart';
// import 'package:procurementapp/rootScreens/Dashboard/dashboard.dart';
// import 'package:procurementapp/color.dart' as color;
// import 'package:procurementapp/rootScreens/menu.dart';
// import 'package:procurementapp/rootScreens/setting.dart';
// import 'rootScreens/Dashboard/dashboard.dart';

// class customTabBar extends StatefulWidget {
//   customTabBar({Key? key}) : super(key: key);

//   @override
//   State<customTabBar> createState() => _customTabBarState();
// }

// class _customTabBarState extends State<customTabBar> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DefaultTabController(
//         length: 5,
//         child: Scaffold(
//           bottomNavigationBar: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               // color: color.blue4,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(14.0),
//                 color: color.grey4,
//                 // border: Border.all()
//               ),
//               height: 70,
//               child: TabBar(
//                 indicatorColor: color.perpal1,
//                 indicatorPadding:
//                     EdgeInsets.only(bottom: 10.0, left: 37, right: 37),
//                 indicator: UnderlineTabIndicator(
//                   borderSide: BorderSide(width: 5.0, color: color.blue4),
//                 ),
//                 tabs: const [
//                   Tab(
//                     icon: Icon(Icons.home_filled, size: 20, color: color.grey5),
//                   ),
//                   Tab(
//                     icon: Icon(Icons.align_vertical_bottom_outlined,
//                         size: 20, color: color.grey5),
//                   ),
//                   Tab(
//                       icon: CircleAvatar(
//                     backgroundColor: color.blue4,
//                     radius: 30,
//                     child: Icon(
//                       Icons.wifi,
//                       color: color.backgroundColor,
//                       size: 40,
//                     ),
//                   )),
//                   Tab(
//                     icon: Icon(Icons.photo_size_select_actual_rounded,
//                         size: 20, color: color.grey5),
//                   ),
//                   Tab(
//                     icon: Icon(Icons.message, size: 20, color: color.grey5),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           body: TabBarView(
//             physics: NeverScrollableScrollPhysics(),
//             children: <Widget>[
//               Container(child: DashBord()),
//               Container(child: Setting()),
//               Container(child: Menu()),
//               Container(),
//               Container()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
