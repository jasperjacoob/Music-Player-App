import 'package:flutter/material.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/navdrawer_widget.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Container(
          child: const Text('Overview'),
        ),
      ),
    );
  }
}
