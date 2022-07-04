import 'package:flutter/material.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/clientdrawer_widget.dart';

class FblivecliScreen extends StatefulWidget {
  FblivecliScreen({Key? key}) : super(key: key);

  @override
  State<FblivecliScreen> createState() => _FblivecliScreenState();
}

class _FblivecliScreenState extends State<FblivecliScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        drawer: ClientDrawerWidget(),
        appBar: AppBar(
          title: const Text('Fb Live'),
        ),
        body: Container(
          child: const Text('Live'),
        ),
      ),
    );
  }
}
