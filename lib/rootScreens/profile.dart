// ignore_for_file: prefer_const_constructors_in_immutables, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:procurementapp/color.dart' as color;
import 'package:procurementapp/rootScreens/common.dart';
import 'package:procurementapp/rootScreens/setting.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;

  displayMiniInfoDialog(text) async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: height / 1.4, left: width / 2, top: 40),
          child: Dialog(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    children: [
                      GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const <Widget>[
                              Icon(
                                Icons.settings_applications_outlined,
                                color: color.blue1,
                              ),
                              Text(
                                'Setting',
                                style:
                                    TextStyle(fontSize: 16, color: color.blue1),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Setting()));
                            // Navigator.pop(context);
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const <Widget>[
                            Icon(
                              Icons.exit_to_app_outlined,
                              color: color.blue1,
                            ),
                            Text(
                              'Log Out',
                              style:
                                  TextStyle(fontSize: 16, color: color.blue1),
                            )
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          LogOutAccountDialod('Log Out');

                          // Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  LogOutAccountDialod(title) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
            insetPadding: EdgeInsets.all(20),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(25.0),
                  ),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: color.blue1,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Are you sure to log out from this account ?',
                    style: TextStyle(
                        color: color.blue1,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GestureDetector(
                          child: Center(
                            child: Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                // color: delete_color
                                //     ? color.perpal1
                                //     : color.backgroundColor,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: color.perpal1),
                              ),
                              child: const Center(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      color: color.perpal1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            setState(() {
                              // delete_color = true;
                            });
                          }),
                      GestureDetector(
                          child: Center(
                            child: Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                // color: delete_color
                                //     ? color.perpal1
                                //     : color.backgroundColor,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: color.perpal1),
                                color: color.perpal1,
                              ),
                              child: const Center(
                                child: Text(
                                  'Sure',
                                  style: TextStyle(
                                      color: color.backgroundColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            setState(() {
                              // delete_color = true;
                            });
                          }),
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        bottomNavigationBar: Common().bottomAppbar(context),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.9,
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: color.backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(91, 103, 202, 0.1),
                              spreadRadius: 3,
                              blurRadius: 15,
                              offset: Offset(-5, 5),
                            )
                          ],
                        ),
                        child: IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.more_outlined,
                              color: color.blue1,
                            )),
                      ),
                      onTap: () => displayMiniInfoDialog("text"),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(91, 103, 202, 0.1),
                          spreadRadius: -10,
                          blurRadius: 20,
                          offset: Offset(-7, 7),
                        )
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: color.backgroundColor,
                      radius: 50,
                      child: Image(
                        image: AssetImage("assets/images/profile-img.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: Text("Steve Job",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          height: 1.5,
                          color: color.blue5,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(bottom: 30.0),
                    child: Text("Stevjob@gmail.com",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: color.blue5,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Stack(
                        children: [
                          Container(
                            width: 160,
                            //height: 160,
                            margin: EdgeInsets.only(bottom: 20, top: 20),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: color.perpal5,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              // border: Border.all(
                              //   color: color.perpal5,
                              //   width: 4.0,
                              // ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(bottom: 20),
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: color.perpal1,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0)),
                                      // border: Border.all(
                                      //   color: color.perpal1,
                                      //   width: 4.0,
                                      // ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: IconTheme(
                                        data: IconThemeData(
                                            color: color.backgroundColor),
                                        child: Icon(Icons.account_box_outlined),
                                      ),
                                    ),
                                  ),
                                ),
                                Text('Personal',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: color.blue1)),
                                Text('8 task',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: color.grey2,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 160,
                            // height: 160,
                            margin: EdgeInsets.only(bottom: 20, top: 20),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: color.blue3,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              // border: Border.all(
                              //   color: color.blue3,
                              //   width: 4.0,
                              // ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(bottom: 20),
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: color.blue2,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0)),
                                      // border: Border.all(
                                      //   color: color.blue2,
                                      //   width: 4.0,
                                      // ),
                                    ),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: IconTheme(
                                          data: IconThemeData(
                                              color: color.backgroundColor),
                                          child: Icon(Icons.work_outline),
                                        )),
                                  ),
                                ),
                                Text('Work',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: color.blue1)),
                                Text('6 task',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: color.grey2,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 160,
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: color.red6,
                        ),
                        child: Column(
                          children: [
                            Container(
                              //margin: EdgeInsets.only(top: 20, bottom: 10),
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(bottom: 20),
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: color.red1,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                // border: Border.all(
                                //   color: color.red1,
                                //   width: 4.0,
                                // ),
                              ),
                              child: IconTheme(
                                data:
                                    IconThemeData(color: color.backgroundColor),
                                child: Icon(Icons.lock_outline),
                              ),
                            ),
                            Text('Private',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: color.blue1)),
                            Text('3 Task',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: color.grey2,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        width: 160,
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: color.green3,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            Container(
                              //margin: EdgeInsets.only(top: 20, bottom: 10),
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(bottom: 20),
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: color.green1,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                // border: Border.all(
                                //   color: color.green1,
                                //   width: 4.0,
                                // ),
                              ),
                              child: IconTheme(
                                data:
                                    IconThemeData(color: color.backgroundColor),
                                child: Icon(Icons.group),
                              ),
                            ),
                            Text('Meeting',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: color.blue1)),
                            Text('4 Task',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: color.grey2,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Stack(
                        children: [
                          Container(
                            width: 160,
                            //height: 170,
                            margin: EdgeInsets.only(bottom: 50),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: color.perpal5,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              // border: Border.all(
                              //   color: color.perpal5,
                              //   width: 4.0,
                              // ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(bottom: 20),
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: color.perpal1,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0)),
                                    // border: Border.all(
                                    //   color: color.perpal1,
                                    //   width: 4.0,
                                    // ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: IconTheme(
                                      data: IconThemeData(
                                          color: color.backgroundColor),
                                      child:
                                          Icon(Icons.calendar_today_outlined),
                                    ),
                                  ),
                                ),
                                Text('Events',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: color.blue1)),
                                Text('4 task',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: color.grey2,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 160,
                            height: 160,
                            margin: EdgeInsets.only(bottom: 50),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: color.red2,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              // border: Border.all(
                              //   color: color.red2,
                              //   width: 4.0,
                              // ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(bottom: 20),
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: color.red1,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0)),
                                    // border: Border.all(
                                    //   color: color.red1,
                                    //   width: 4.0,
                                    // ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: IconTheme(
                                      data: IconThemeData(
                                          color: color.backgroundColor),
                                      child: Icon(Icons.add_box_outlined),
                                    ),
                                  ),
                                ),
                                Text('Create Board',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: color.blue1)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
