import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicplayer/constant.dart';

class ClientAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  ClientAppBar({Key? key, required this.title}) : super(key: key);
  final AppBar appBar = AppBar();
  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: Builder(builder: (context) {
        return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(MdiIcons.menu));
      }),
      elevation: 0,
    );
  }
}
