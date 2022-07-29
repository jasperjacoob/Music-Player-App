import 'package:flutter/material.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/clientappbar_widget.dart';
import 'package:musicplayer/widgets/clientdrawer_widget.dart';
import 'package:musicplayer/styles.dart';

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
