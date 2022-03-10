import 'package:flutter/material.dart';
import 'package:procurementapp/color.dart' as color;
import 'package:procurementapp/global.dart' as global;
import 'package:procurementapp/rootScreens/Dashboard/dashboard.dart';
import 'package:procurementapp/rootScreens/RecievedRFP/received_RFP.dart';
import 'package:procurementapp/rootScreens/RecievedRFQ/received_RFQ.dart';
import 'package:procurementapp/rootScreens/menu.dart';
import 'package:procurementapp/rootScreens/profile.dart';

class Common implements Function {
  userProfile(context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(right: 20.0),
              decoration: const BoxDecoration(
                color: color.backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(91, 103, 202, 0.1),
                    spreadRadius: 1,
                    blurRadius: 20,
                    offset: Offset(-5, 5),
                  )
                ],
              ),
              child: const CircleAvatar(
                backgroundColor: color.backgroundColor,
                radius: 50,
                child: Image(
                  width: 25,
                  image: AssetImage("assets/images/profile-img.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            onTap: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => Profile(),
                ),
                (Route<dynamic> route) => false),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                // color: color.blue1,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hi, PSDS Admin',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: color.blue1,
                    ),
                  ),
                ),
              ),
              Container(
                child: const Text(
                  'Let’s make this day productive',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bottomAppbar(context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 60,
      decoration: BoxDecoration(
          color: color.grey4, borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(bottom: 10),
      // padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: global.tabNo == '1'
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Icon(
                  Icons.mail,
                  size: 35,
                  color: global.tabNo == '1' ? color.perpal1 : color.grey3,
                ),
                onTap: () {
                  global.tabNo = '1';
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) => DashBord(),
                      ),
                      (Route<dynamic> route) => false);
                },
              ),
              global.tabNo == '1'
                  ? const CircleAvatar(
                      radius: 4,
                      backgroundColor: color.perpal1,
                    )
                  : SizedBox()
            ],
          ),
          Column(
            mainAxisAlignment: global.tabNo == '2'
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Icon(
                  Icons.message,
                  size: 35,
                  color: global.tabNo == '2' ? color.perpal1 : color.grey3,
                ),
                onTap: () {
                  global.tabNo = '2';
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) => ReceivedRFP(),
                      ),
                      (Route<dynamic> route) => false);
                },
              ),
              global.tabNo == '2'
                  ? const CircleAvatar(
                      radius: 4,
                      backgroundColor: color.perpal1,
                    )
                  : SizedBox()
            ],
          ),
          Column(
            mainAxisAlignment: global.tabNo == '3'
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: CircleAvatar(
                  radius: global.tabNo == '3' ? 25 : 30,
                  backgroundColor: color.perpal1,
                  child: Icon(
                    Icons.wifi,
                    size: global.tabNo == '3' ? 35 : 40,
                    color: color.backgroundColor,
                  ),
                ),
                onTap: () {
                  global.tabNo = '3';
                  menuDialog(context);
                },
              ),
              global.tabNo == '3'
                  ? const CircleAvatar(
                      radius: 4,
                      backgroundColor: color.perpal1,
                    )
                  : SizedBox()
            ],
          ),
          Column(
            mainAxisAlignment: global.tabNo == '4'
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Icon(
                  Icons.show_chart_outlined,
                  size: 35,
                  color: global.tabNo == '4' ? color.perpal1 : color.grey3,
                ),
                onTap: () {
                  global.tabNo = '4';
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) => RecievedRFQ(),
                      ),
                      (Route<dynamic> route) => false);
                },
              ),
              global.tabNo == '4'
                  ? const CircleAvatar(
                      radius: 4,
                      backgroundColor: color.perpal1,
                    )
                  : SizedBox()
            ],
          ),
          Column(
            mainAxisAlignment: global.tabNo == '5'
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Icon(
                  Icons.folder,
                  size: 35,
                  color: global.tabNo == '5' ? color.perpal1 : color.grey3,
                ),
                onTap: () {
                  global.tabNo = '5';
                },
              ),
              global.tabNo == '5'
                  ? const CircleAvatar(
                      radius: 4,
                      backgroundColor: color.perpal1,
                    )
                  : SizedBox()
            ],
          ),
        ],
      ),
    );
  }

  menuDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const Dialog(
          insetPadding: EdgeInsets.only(bottom: 70),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Menu(),
        );
      },
    );
  }

  toastMessage(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
