import 'package:flutter/material.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/navdrawer_widget.dart';

class VodcastScreen extends StatefulWidget {
  VodcastScreen({Key? key}) : super(key: key);

  @override
  State<VodcastScreen> createState() => _VodcastScreenState();
}

class _VodcastScreenState extends State<VodcastScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Vodcast'),
        ),
        body: Container(
          child: const Text('Livee'),
        ),
      ),
    );
  }
}
