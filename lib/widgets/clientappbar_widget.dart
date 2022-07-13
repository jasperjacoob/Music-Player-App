import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicplayer/constant.dart';

class ClientAppBar extends StatelessWidget implements PreferredSizeWidget {
  ClientAppBar({Key? key}) : super(key: key);
  final AppBar appBar = AppBar();
  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(builder: (context) {
        return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(MdiIcons.menu));
      }),
      elevation: 0,
    );
  }
}
