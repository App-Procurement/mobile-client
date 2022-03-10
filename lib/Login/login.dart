// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:procurementapp/color.dart' as color;
import 'package:procurementapp/global.dart' as global;
import '../rootScreens/Dashboard/dashboard.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  final username_txt = TextEditingController();
  final password_txt = TextEditingController();
  bool obscurepwd = true;

  final emailValid = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  _showHidePassword() {
    obscurepwd = !obscurepwd;
    setState(() => {obscurepwd});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 80.0, top: 80.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: color.perpal1,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: TextFormField(
                        controller: username_txt,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          } else if (!emailValid.hasMatch(value)) {
                            return 'Please enter valid email';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 2.0,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Email ID or Username',
                          contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: color.grey2,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: color.perpal1),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: color.grey2),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: TextFormField(
                        controller: password_txt,
                        obscureText: obscurepwd,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 2.0,
                        ),
                        decoration: InputDecoration(
                            hintText: obscurepwd ? '*******' : 'Password',
                            contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                            prefixIcon: Icon(
                              Icons.lock_clock_outlined,
                              color: color.grey2,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: color.perpal1),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: color.grey2),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                obscurepwd
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye,
                                color: Colors.grey,
                              ),
                              onPressed: _showHidePassword,
                            )),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30.0, top: 10.0),
                      child: GestureDetector(
                        child: const Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Forgot Password ?',
                            style:
                                TextStyle(color: color.perpal1, fontSize: 12),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 50.0, top: 10.0),
                      child: GestureDetector(
                        onTap: () => {
                          if (_formKey.currentState!.validate())
                            {
                              global.authToken = true,
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DashBord())),
                            }
                        },
                        child: Container(
                            decoration: const BoxDecoration(
                              color: color.perpal1,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
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
                                'Login',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: color.backgroundColor),
                              ),
                            )),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30.0, top: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Expanded(
                              child: Divider(
                            thickness: 2,
                          )),
                          Expanded(child: Center(child: Text('or with'))),
                          Expanded(
                              child: Divider(
                            thickness: 2,
                          )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 70.0, top: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Container(
                              width: 42,
                              height: 42,
                              margin: EdgeInsets.only(left: 8.0, right: 8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: color.grey1),
                              ),
                              child: CircleAvatar(
                                backgroundColor: color.backgroundColor,
                                radius: 20,
                                child: Image.asset(
                                  'assets/icons/google.png',
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ),
                            onTap: () {},
                          ),
                          GestureDetector(
                            child: Container(
                              width: 42,
                              height: 42,
                              margin: EdgeInsets.only(left: 8.0, right: 8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: color.grey1),
                              ),
                              child: CircleAvatar(
                                backgroundColor: color.backgroundColor,
                                radius: 20,
                                child: Image.asset(
                                  'assets/icons/facebook.png',
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ),
                            onTap: () {},
                          ),
                          
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 0.0, top: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don’t have an account? ',
                            style:
                                TextStyle(color: color.perpal2, fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: color.perpal2,
                              ),
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
        ),
      ),
    );
  }
}
