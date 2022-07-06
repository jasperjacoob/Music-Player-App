import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicplayer/constant.dart';

class AppBarNav extends StatelessWidget implements PreferredSizeWidget {
  AppBarNav({Key? key}) : super(key: key);
  final AppBar appBar = AppBar();
  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: [
        PopupMenuButton<int>(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: primary,
                child: ClipOval(
                  child: SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: Image.network(
                        "https://images.unsplash.com/photo-1654650231825-f1c06db0c1ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            itemBuilder: (context) => [
                  PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: [
                          const Icon(
                            MdiIcons.cog,
                            color: onTertiary,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            'Settings',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      )),
                  PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                        children: [
                          const Icon(
                            MdiIcons.logout,
                            color: onTertiary,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            'Logout',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ))
                ])
      ],
    );
  }
}
