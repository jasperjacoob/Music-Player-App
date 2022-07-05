import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../custom/clipbox_container.dart';

class SigninScreen extends StatefulWidget {
  SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: primary,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: height * .30,
                  child: Image.asset(
                    'assets/images/smlogo.png',
                    scale: 6,
                  ),
                ),
                Expanded(
                  child: ClipPath(
                    clipper: ClipBox(),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: background,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sign In"),
                          TextFormField(),
                          TextFormField(),
                          ElevatedButton(
                              onPressed: onPressed, child: Text("Sign in"))
                        ],
                      ),
                    ),
                  ),
                )
              ])),
    );
  }

  void onPressed() {
    Navigator.of(context).popAndPushNamed(dashboardRoute);
  }
}
