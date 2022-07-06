import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/screens/admin/dashboard_screen.dart';
import 'package:musicplayer/screens/admin/fblive_screen.dart';
import 'package:musicplayer/screens/admin/live_screen.dart';
import 'package:musicplayer/screens/admin/podcast_screen.dart';
import 'package:musicplayer/screens/admin/vodcast_screen.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: padding,
        children: <Widget>[
          const SizedBox(height: 48),
          buildMenuItem(
              text: 'Dashboard',
              icon: MdiIcons.homeVariantOutline,
              onClicked: () => selectedItem(context, 0)),
          const SizedBox(height: 16),
          buildMenuItem(
              text: 'Live',
              icon: MdiIcons.table,
              onClicked: () => selectedItem(context, 1)),
          const SizedBox(height: 16),
          buildMenuItem2(
              text: 'Events', icon: MdiIcons.calendarTextOutline, context),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: onPrimary),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Create Account',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: secondary),
                  ),
                  const Icon(
                    MdiIcons.plus,
                    color: secondary,
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: onTertiary,
      ),
      title: Text(
        text,
        style: const TextStyle(
            color: onTertiary, fontFamily: 'Inter', fontSize: 16),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Widget buildMenuItem2(
    BuildContext context, {
    required String text,
    required IconData icon,
    // VoidCallback? onClicked,
  }) {
    return ExpansionTile(
      backgroundColor: background,
      leading: Icon(
        icon,
        color: onTertiary,
        size: 30,
      ),
      title: Text(
        text,
        style: const TextStyle(color: onTertiary),
      ),
      children: [
        ListTile(
          title: const Text('Podcast'),
          onTap: () => selectedItem(context, 2),
        ),
        ListTile(
            title: const Text('Vodcast'),
            onTap: () => selectedItem(context, 3)),
        ListTile(
            title: const Text('FB Live'),
            onTap: () => selectedItem(context, 4)),
      ],
    );
  }

  selectedItem(BuildContext context, int i) {
    Navigator.of(context).pop();
    switch (i) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DashboardScreen()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LiveScreen()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PodcastScreen()));
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => VodcastScreen()));
        break;
      case 4:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => FbliveScreen()));
        break;
      default:
    }
  }
}
