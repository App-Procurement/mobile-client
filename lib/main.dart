// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:procurementapp/Bindding/StoreBindding.dart';
import 'package:procurementapp/rootScreens/Dashboard/dashboard.dart';
import 'Login/mainscreen.dart';
import 'package:procurementapp/global.dart' as global;
import 'package:procurementapp/color.dart' as color;
// import 'rootScreens/dashboard.dart';
import 'package:procurementapp/tabBar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQueryData(),
        child: GetMaterialApp(
            title: 'ProcurementApp',
            theme: ThemeData(),
            initialBinding: StoreBinding(),
            debugShowCheckedModeBanner: false,
            home: global.authToken == false ? HomeScreen() : DashBord()));
  }
}
