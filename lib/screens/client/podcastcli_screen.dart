import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/clientdrawer_widget.dart';

class PodcastcliScreen extends StatefulWidget {
  PodcastcliScreen({Key? key}) : super(key: key);

  @override
  State<PodcastcliScreen> createState() => _PodcastcliScreenState();
}

class _PodcastcliScreenState extends State<PodcastcliScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: background,
          drawer: ClientDrawerWidget(),
          body: Builder(builder: (context) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: const Icon(MdiIcons.menu),
                  ),
                )
              ],
            );
          })),
    );
  }
}
