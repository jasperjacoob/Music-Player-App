import 'package:flutter/material.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/navigationdrawer_widget.dart';

class FbliveScreen extends StatefulWidget {
  FbliveScreen({Key? key}) : super(key: key);

  @override
  State<FbliveScreen> createState() => _FbliveScreenState();
}

class _FbliveScreenState extends State<FbliveScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('FB Live'),
        ),
        body: Container(
          child: const Text('Livee'),
        ),
      ),
    );
  }
}
