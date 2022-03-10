import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:procurementapp/color.dart' as color;
import 'package:procurementapp/rootScreens/common.dart';

class Setting extends StatefulWidget {
  Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool switch_notification = false;
  bool switch_notification_ring = false;
  bool lang = false;
  bool delete_color = false;

  displayLoadingDialog(text) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WillPopScope(
          child: Dialog(
            insetPadding: EdgeInsets.all(20),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  //width: 400,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 5, left: 20, right: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: Text(
                              'Language',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: color.blue5,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                'English',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: color.blue5,
                                ),
                              ),
                              Checkbox(
                                activeColor: color.perpal1,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    lang = val!;
                                  });
                                },
                                value: lang,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                'Chinese',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: color.blue5,
                                ),
                              ),
                              Checkbox(
                                activeColor: color.perpal1,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    lang = val!;
                                  });
                                },
                                value: lang,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                'Japanese',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: color.blue5,
                                ),
                              ),
                              Checkbox(
                                activeColor: color.perpal1,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    lang = val!;
                                  });
                                },
                                value: lang,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                'Korean',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: color.blue5,
                                ),
                              ),
                              Checkbox(
                                activeColor: color.perpal1,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    lang = val!;
                                  });
                                },
                                value: lang,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                'Russian',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: color.blue5,
                                ),
                              ),
                              Checkbox(
                                activeColor: color.perpal1,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    lang = val!;
                                  });
                                },
                                value: lang,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )

                  // Row(
                  //   children: <Widget>[
                  //     const CircularProgressIndicator(
                  //       valueColor: AlwaysStoppedAnimation<Color>(color.perpal1),
                  //     ),
                  //     const SizedBox(
                  //       width: 16,
                  //     ),
                  //     Text(
                  //       text,
                  //       style: TextStyle(fontSize: 16),
                  //     )
                  //   ],
                  // ),
                  ),
            ),
          ),
          onWillPop: () {
            return Future(() => true);
          },
        );
      },
    );
  }

  deleteAccountDialod(title) {
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              height: MediaQuery.of(context).size.height * 0.3,
              //width: MediaQuery.of(context).size.width * 0.9,
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
                    'Are you sure to delete this account ?',
                    style: TextStyle(
                        color: color.blue1,
                        fontSize: 18,
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
                              delete_color = true;
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
                                  color: color.perpal1),
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
                              delete_color = true;
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

  style() {
    return const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w500, color: color.blue1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        bottomNavigationBar: Common().bottomAppbar(context),
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // color: color.blue2,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Container(
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_rounded,
                                color: color.blue1,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: color.backgroundColor,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(28, 142, 185, 241),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 4),
                                )
                              ],
                            ),
                          )),
                      const Padding(
                        padding: EdgeInsets.only(left: 70),
                        child: Text(
                          'Setting',
                          style: TextStyle(
                              fontSize: 18,
                              color: color.blue1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  // color: color.blue3,
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'General',
                          style: TextStyle(
                              fontSize: 16,
                              color: color.blue1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: <Widget>[
                          const Expanded(
                            child: Text(
                              'Language',
                              style: TextStyle(
                                fontSize: 16,
                                color: color.blue5,
                              ),
                            ),
                          ),
                          const Text(
                            'Language',
                            style: TextStyle(
                              fontSize: 16,
                              color: color.blue5,
                            ),
                          ),
                          GestureDetector(
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: color.blue5,
                              size: 20,
                            ),
                            onTap: () => displayLoadingDialog('Language'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          child: const Text(
                            'Delete Account',
                            style: TextStyle(
                              fontSize: 16,
                              color: color.blue5,
                            ),
                          ),
                          onTap: () => deleteAccountDialod('Delete Account'),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Notifications',
                          style: TextStyle(
                              fontSize: 16,
                              color: color.blue1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: <Widget>[
                          const Expanded(
                            child: Text(
                              'Allow Notification',
                              style: TextStyle(
                                fontSize: 16,
                                color: color.blue5,
                              ),
                            ),
                          ),
                          FlutterSwitch(
                            width: 50.0,
                            height: 25.0,
                            valueFontSize: 25.0,
                            toggleSize: 20.0,
                            value: switch_notification,
                            borderRadius: 20.0,
                            inactiveColor: color.blue6,
                            activeColor: color.perpal1,
                            onToggle: (val) {
                              setState(() {
                                switch_notification = val;
                              });
                            },
                            //value: switch_notification,
                          ),
                          // Switch(
                          //   activeColor: color.perpal1,
                          //   inactiveThumbColor: color.backgroundColor,
                          //   onChanged: (val) {
                          //     setState(() {
                          //       switch_notification = val;
                          //     });
                          //   },
                          //   value: switch_notification,
                          // ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Row(
                          children: <Widget>[
                            const Expanded(
                              child: Text(
                                'Allow the Notification Rings',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: color.blue5,
                                ),
                              ),
                            ),
                            FlutterSwitch(
                              width: 50.0,
                              height: 25.0,
                              valueFontSize: 25.0,
                              toggleSize: 20.0,
                              value: switch_notification_ring,
                              borderRadius: 20.0,
                              inactiveColor: color.blue6,
                              activeColor: color.perpal1,
                              //inactiveThumbColor: color.backgroundColor,

                              onToggle: (val) {
                                setState(() {
                                  switch_notification_ring = val;
                                });
                              },
                              //value: switch_notification_ring,
                            ),
                            // Switch(
                            //   activeColor: color.perpal1,
                            //   inactiveThumbColor: color.backgroundColor,
                            //   onChanged: (val) {
                            //     setState(() {
                            //       switch_notification_ring = val;

                            //     });
                            //   },
                            //   value: switch_notification_ring,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
