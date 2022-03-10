// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_is_empty

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:procurementapp/color.dart' as color;

class otp extends StatefulWidget {
  otp({Key? key}) : super(key: key);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.8,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 70, top: 100),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Otp',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: color.perpal1,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Icon(
                            Icons.mail_outline_outlined,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: _textFieldOTP(
                            first: true,
                            last: false,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: _textFieldOTP(
                            first: true,
                            last: false,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: _textFieldOTP(
                            first: true,
                            last: false,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: _textFieldOTP(
                            first: true,
                            last: false,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: _textFieldOTP(
                            first: true,
                            last: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 0.0, top: 80.0),
                    decoration: const BoxDecoration(
                      color: color.perpal1,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(91, 103, 202, 0.1),
                          spreadRadius: 0,
                          blurRadius: 20,
                          offset: Offset(0, 0),
                        )
                      ],
                    ),
                    height: 52,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: color.backgroundColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({required bool first, last}) {
    return Container(
      height: 80,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: true,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
            color: color.perpal1,
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: color.grey2,
                ),
                borderRadius: BorderRadius.circular(0)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: color.perpal1,
                ),
                borderRadius: BorderRadius.circular(0)),
          ),
        ),
      ),
    );
  }
}
