import 'package:flutter/material.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/appbar_widget.dart';
import 'package:musicplayer/widgets/navdrawer_widget.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBarNav(),
        body: Column(
          children: [
            Container(
              padding: padding,
              child: Text(
                'Live',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
