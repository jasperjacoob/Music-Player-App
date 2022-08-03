import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:musicplayer/screens/auth/loading_screen.dart';
import 'package:musicplayer/screens/auth/signin_screen.dart';
import 'package:musicplayer/screens/client/musiccli_screen.dart';

import 'package:provider/provider.dart';

import '../model/user.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    Future<String> bids() async {
      FlutterSecureStorage storage = const FlutterSecureStorage();
      String? currentToken = await storage.read(key: "token");
      debugPrint(currentToken);
      if (currentToken != null) {
        Map<String, String> requestHeaders = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${currentToken}'
        };
        Response userRes = await http.get(
            Uri.parse("http://www.avsoundstation.com/api/user"),
            headers: requestHeaders);
        if (userRes.body.toString().contains("Sign In")) {
          await storage.delete(key: "token");
          return "No Data";
        }
        User currentUser = User.fromMap(jsonDecode(userRes.body));
        currentUser.token = currentToken;
        Provider.of<User>(context, listen: false).setUser(currentUser);

        return "Authenticated";
      }

      return "No Data";
    }

    return FutureBuilder(
      future: bids(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          debugPrint(snapshot.connectionState.name);
          if (snapshot.data == "No Data") {
            return SigninScreen();
          }
          return MusiccliScreen();
        }
        debugPrint(snapshot.connectionState.name);
        return LoadingScreen();
      },
    );
  }
}
