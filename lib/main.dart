import 'package:flutter/material.dart';
import 'package:musicplayer/model/user.dart';
import 'package:musicplayer/provider/entertainmentprovider.dart';
import 'package:musicplayer/routes.dart';

import 'package:musicplayer/screens/auth/signin_screen.dart';
import 'package:musicplayer/screens/client/musiccli_screen.dart';
import 'package:provider/provider.dart';

import 'custom/auth_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<User>(
        create: (_) => User(),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: generateRoute,
            home: AuthWidget()));
  }
}
