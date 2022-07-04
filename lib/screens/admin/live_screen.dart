import 'package:flutter/material.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/navdrawer_widget.dart';

class LiveScreen extends StatefulWidget {
  LiveScreen({Key? key}) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Live'),
        ),
        body: Container(
          child: const Text('Livee'),
        ),
      ),
    );
  }
}
