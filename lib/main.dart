import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/model/user.dart';
import 'package:musicplayer/provider/entertainmentprovider.dart';
import 'package:musicplayer/routes.dart';
import 'package:musicplayer/screens/auth/loading_screen.dart';

import 'package:musicplayer/screens/auth/signin_screen.dart';
import 'package:musicplayer/screens/client/musiccli_screen.dart';
import 'package:musicplayer/styles.dart';
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: background, statusBarIconBrightness: Brightness.dark));
    return Provider<User>(
        create: (_) => User(),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: defaultThemeData,
            onGenerateRoute: generateRoute,
            home: SigninScreen()));
  }
}
