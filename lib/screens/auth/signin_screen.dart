import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../custom/clipbox_container.dart';
import '../../model/user.dart';

class SigninScreen extends StatefulWidget {
  SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

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
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                          ),
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

  void onPressed() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    Map<String, String> body = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    Response response = await http.post(
        Uri.parse("http://www.avsoundstation.com/api/login"),
        headers: requestHeaders,
        body: jsonEncode(body));
    Map<String, dynamic> token = jsonDecode(response.body);
    if (token['message'] != null) {
      debugPrint("unauthenticated");
      return;
    }
    await storage.write(key: "token", value: token['access_token']);
    String currentToken = token["access_token"];
    Map<String, String> userHeader = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $currentToken'
    };

    Response userRes = await http.get(
        Uri.parse("http://www.avsoundstation.com/api/user"),
        headers: userHeader);
    User currentUser = User.fromMap(jsonDecode(userRes.body));
    currentUser.token = currentToken;
    Provider.of<User>(context, listen: false).setUser(currentUser);

    Navigator.of(context).popAndPushNamed(dashboardRoute);
  }
}
