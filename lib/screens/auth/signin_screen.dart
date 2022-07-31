import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isenabled = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: background,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipPath(
                    clipper: ClipBox(),
                    child: Container(
                      padding: const EdgeInsets.only(top: 8, bottom: 40),
                      color: primary,
                      child: Container(
                        padding: const EdgeInsets.all(80),
                        child: Image.asset(
                          'assets/images/sm.png',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: const BoxDecoration(color: background),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Sign In",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Email";
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return "Please Enter Valid Email";
                              }
                              return null;
                            },
                            style: const TextStyle(color: onSecondary),
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: "Email",
                              labelText: "Email",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Password";
                              }
                            },
                            style: const TextStyle(color: onSecondary),
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              hintText: "Password",
                              labelText: "Password",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: onPressed,
                              child: Text(
                                "Sign in",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    ?.copyWith(color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                )
              ])),
    );
  }

  Future<void> _showMySucessDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Login Succesfully',
            style: Theme.of(context).textTheme.headline2,
          ),
          content: Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height / 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  MdiIcons.checkCircle,
                  size: 45,
                  color: Colors.green,
                ),
                Text(
                  "You are all set!",
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(musicRoute, (route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyErrorDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Error Login',
            style: Theme.of(context).textTheme.headline2,
          ),
          content: Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height / 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  MdiIcons.alertCircle,
                  size: 45,
                  color: Colors.red,
                ),
                Text(
                  "No user found",
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Retry'),
              onPressed: () {
                setState(() {
                  isenabled = true;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void onPressed() async {
    if (_formkey.currentState!.validate()) {
      if (isenabled) {
        debugPrint("PINDOT");
        setState(() {
          isenabled = false;
        });
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
          _showMyErrorDialog();
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
        _showMySucessDialog();
      }
      debugPrint("NO CLICKed");
    }
  }
}
