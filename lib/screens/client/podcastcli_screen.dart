import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/clientappbar_widget.dart';
import 'package:musicplayer/widgets/clientdrawer_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PodcastcliScreen extends StatefulWidget {
  PodcastcliScreen({Key? key}) : super(key: key);

  @override
  State<PodcastcliScreen> createState() => _PodcastcliScreenState();
}

class _PodcastcliScreenState extends State<PodcastcliScreen> {
  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: ClientAppBar(title: "Podcast"),
        body: Column(
          children: [
            Container(
              padding: padding,
              child: Text(
                'Vodcast',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
