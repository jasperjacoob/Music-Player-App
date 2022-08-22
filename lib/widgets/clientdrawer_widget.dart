import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  String? currentSelected;
  ClientDrawerWidget({
    Key? key,
    this.currentSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: paddingDrawer,
        children: <Widget>[
          const SizedBox(height: 48),
          buildMenuItem(
              text: 'Music',
              icon: MdiIcons.music,
              selected: currentSelected != null && currentSelected == musicRoute
                  ? true
                  : false,
              onClicked: () => selectedItem(context, 0)),
          const SizedBox(height: 16),
          buildMenuItem(
              text: 'Podcast',
              icon: MdiIcons.accountMultiple,
              selected:
                  currentSelected != null && currentSelected == podcastRoute
                      ? true
                      : false,
              onClicked: () => selectedItem(context, 1)),
          const SizedBox(height: 16),
          buildMenuItem(
              text: 'Vodcast',
              icon: MdiIcons.videoWireless,
              selected:
                  currentSelected != null && currentSelected == vodcastRoute
                      ? true
                      : false,
              onClicked: () => selectedItem(context, 2)),
          const SizedBox(height: 16),
          buildMenuItem(
              text: 'FB Live',
              icon: MdiIcons.television,
              selected:
                  currentSelected != null && currentSelected == fbliveRoute
                      ? true
                      : false,
              onClicked: () => selectedItem(context, 3)),
          const SizedBox(height: 16),
          buildMenuItem(
              text: 'Logout',
              icon: MdiIcons.logout,
              selected: false,
              onClicked: () => selectedItem(context, 4)),
        ],
      ),
    );
  }
}

Future<void> _showMyLogoutDialog(context, storage, currentToken) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Notice',
          style: Theme.of(context).textTheme.headline2,
        ),
        content: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Are you sure you want to logout?",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style
                              ?.copyWith(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                          onPressed: () => {Navigator.of(context).pop()},
                          child: Text(
                            "Cancel",
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                ?.copyWith(color: Colors.black54),
                          )),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () =>
                              onPressed(currentToken, storage, context),
                          child: Text(
                            "Yes",
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                ?.copyWith(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

Future<void> _showMyLoadingDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Notice',
          style: Theme.of(context).textTheme.headline2,
        ),
        content: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Logging out",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              const SpinKitRing(
                size: 35.0,
                color: primary,
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget buildMenuItem(
    {required String text,
    required IconData icon,
    VoidCallback? onClicked,
    selected}) {
  return Container(
    decoration: BoxDecoration(
        border: Border(
            left:
                BorderSide(color: selected ? primary : background, width: 10))),
    child: ListTile(
      leading: Icon(
        icon,
        color: onSecondaryText,
      ),
      title: Text(
        text,
        style: const TextStyle(color: onSecondaryText),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    ),
  );
}

selectedItem(BuildContext context, int i) async {
  switch (i) {
    case 0:
      Navigator.of(context).pushReplacementNamed(musicRoute);
      break;
    case 1:
      Navigator.of(context).pushReplacementNamed(podcastRoute);
      break;
    case 2:
      Navigator.of(context).pushReplacementNamed(vodcastRoute);
      break;
    case 3:
      Navigator.of(context).pushReplacementNamed(fbliveRoute);
      break;
    default:
      FlutterSecureStorage storage = const FlutterSecureStorage();
      String? currentToken = context.read<User>().token;

      _showMyLogoutDialog(context, storage, currentToken);

      break;
  }
}

void onPressed(currentToken, storage, context) async {
  _showMyLoadingDialog(context);
  Map<String, String> userHeader = {'Authorization': 'Bearer $currentToken'};

  Response logoutRes = await http.post(
      Uri.parse("http://www.avsoundstation.com/api/logout"),
      headers: userHeader);

  if (jsonDecode(logoutRes.body)["message"] == "Successfully logged out") {
    await storage.delete(key: "token");
    Provider.of<User>(context, listen: false).setUser(User());
  } else {
    Navigator.of(context).pop();
    return;
  }
  Navigator.of(context).pushNamedAndRemoveUntil(signinRoute, (route) => false);
}
