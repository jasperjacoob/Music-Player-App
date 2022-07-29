import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:just_audio/just_audio.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/provider/entertainmentprovider.dart';
import 'package:musicplayer/screens/auth/signin_screen.dart';
import 'package:musicplayer/screens/client/fblivecli_screen.dart';
import 'package:musicplayer/screens/client/musiccli_screen.dart';
import 'package:musicplayer/screens/client/podcastcli_screen.dart';
import 'package:musicplayer/screens/client/vodcastcli_screen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class ClientDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 16);

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

selectedItem(BuildContext context, int i) async {
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
      FlutterSecureStorage storage = const FlutterSecureStorage();
      String? currentToken = context.read<User>().token;

      Map<String, String> userHeader = {
        'Authorization': 'Bearer $currentToken'
      };

      Response logoutRes = await http.post(
          Uri.parse("http://www.avsoundstation.com/api/logout"),
          headers: userHeader);
      debugPrint(logoutRes.body);
      if (jsonDecode(logoutRes.body)["message"] == "Successfully logged out") {
        await storage.delete(key: "token");
        Provider.of<User>(context, listen: false).setUser(User());
      }
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SigninScreen()));
      break;
  }
}
