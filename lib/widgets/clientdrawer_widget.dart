import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/provider/entertainmentprovider.dart';
import 'package:musicplayer/screens/client/fblivecli_screen.dart';
import 'package:musicplayer/screens/client/musiccli_screen.dart';
import 'package:musicplayer/screens/client/podcastcli_screen.dart';
import 'package:musicplayer/screens/client/vodcastcli_screen.dart';
import 'package:provider/provider.dart';

class ClientDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  ClientDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: padding,
        children: <Widget>[
          const SizedBox(height: 48),
          buildMenuItem(
              text: 'Music',
              icon: MdiIcons.music,
              onClicked: () => selectedItem(context, 0)),
          const SizedBox(height: 16),
          buildMenuItem(
              text: 'Podcast',
              icon: MdiIcons.accountMultiple,
              onClicked: () => selectedItem(context, 1)),
          const SizedBox(height: 16),
          buildMenuItem(
              text: 'Vodcast',
              icon: MdiIcons.videoWireless,
              onClicked: () => selectedItem(context, 2)),
          const SizedBox(height: 16),
          buildMenuItem(
              text: 'FB Live',
              icon: MdiIcons.television,
              onClicked: () => selectedItem(context, 3)),
          const SizedBox(height: 16),
          buildMenuItem(
              text: 'Logout',
              icon: MdiIcons.logout,
              onClicked: () => selectedItem(context, 4)),
        ],
      ),
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  return ListTile(
    leading: Icon(
      icon,
      color: onTertiary,
    ),
    title: Text(
      text,
      style: const TextStyle(color: onTertiary),
    ),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

selectedItem(BuildContext context, int i) {
  Navigator.of(context).pop();
  switch (i) {
    case 0:
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MusiccliScreen()));
      break;
    case 1:
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => PodcastcliScreen()));
      break;
    case 2:
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => VodcastcliScreen()));
      break;
    case 3:
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => FblivecliScreen()));
      break;
    default:
  }
}
