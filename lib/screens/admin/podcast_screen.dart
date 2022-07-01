import 'package:flutter/material.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/navigationdrawer_widget.dart';

class PodcastScreen extends StatefulWidget {
  PodcastScreen({Key? key}) : super(key: key);

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Podcast'),
        ),
        body: Container(
          child: const Text('Livee'),
        ),
      ),
    );
  }
}
