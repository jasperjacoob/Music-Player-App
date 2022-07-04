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
    return SafeArea(
      child: Scaffold(
          backgroundColor: primary,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/smlogo.png',
                  scale: 6,
                ),
                Expanded(
                  child: ClipPath(
                    clipper: ClipBox(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: background,
                      ),
                    ),
                  ),
                )
              ])),
    );
  }
}
