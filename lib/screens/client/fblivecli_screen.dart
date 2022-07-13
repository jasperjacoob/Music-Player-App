import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/clientappbar_widget.dart';
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
        drawer: const ClientDrawerWidget(),
        appBar: ClientAppBar(),
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
