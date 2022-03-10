// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:procurementapp/Login/signup.dart';
import 'package:procurementapp/color.dart' as color;
import 'login.dart';
import 'otp.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * .2,
                    margin: const EdgeInsets.only(top: 80.0, bottom: 80.0),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/procurement-banner-img.jpg'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(bottom: 30.0),
                    child: Text("Synecticks Procurement",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          height: 1.5,
                          color: color.perpal1,
                        )),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(bottom: 50.0),
                    child: Text(
                        "Plan what you will to do be more organized for today, tommorow and beyond",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: color.perpal2)),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => login())),
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 52,
                        margin: const EdgeInsets.only(bottom: 20.0),
                        decoration: BoxDecoration(
                          color: color.perpal1,
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(91, 103, 202, 0.1),
                              spreadRadius: 1,
                              blurRadius: 20,
                              offset: Offset(0, 0),
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: color.backgroundColor,
                            ),
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Register())),
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 30,
                        margin: EdgeInsets.only(bottom: 20),
                        child: Center(
                          child: Text('Sign up',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: color.perpal1)),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.navigate_before),
        //   onPressed: () => Navigator.of(context).push(
        //       MaterialPageRoute(builder: (BuildContext context) => otp())),
        // ),
      ),
    );
  }
}
