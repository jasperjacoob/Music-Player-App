import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/screens/admin/dashboard_screen.dart';
import 'package:musicplayer/screens/client/musiccli_screen.dart';
import 'package:musicplayer/styles.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: defaultThemeData,
      home: DashboardScreen(),
    );
  }
}
