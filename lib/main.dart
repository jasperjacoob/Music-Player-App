import 'package:flutter/material.dart';
import 'package:musicplayer/screens/admin/dashboard_screen.dart';
import 'package:musicplayer/screens/client/musiccli_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: MusiccliScreen(),
    );
  }
}
