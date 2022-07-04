import 'package:flutter/material.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/clientdrawer_widget.dart';

class VodcastcliScreen extends StatefulWidget {
  VodcastcliScreen({Key? key}) : super(key: key);

  @override
  State<VodcastcliScreen> createState() => _VodcastcliScreenState();
}

class _VodcastcliScreenState extends State<VodcastcliScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        drawer: ClientDrawerWidget(),
        appBar: AppBar(
          title: const Text('Vodcast'),
        ),
        body: Container(
          child: const Text('Vodcast'),
        ),
      ),
    );
  }
}
