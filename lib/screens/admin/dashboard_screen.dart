import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/appbar_widget.dart';
import 'package:musicplayer/widgets/navdrawer_widget.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: onBackground,
        drawer: const NavigationDrawerWidget(),
        appBar: AppBarNav(),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: padding,
              child: Text(
                'Overview',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
              padding: padding,
              child: Column(children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: primary),
                    margin: margin,
                    padding: padding,
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: onPodcast,
                          child: ClipOval(
                            child: SizedBox(
                              width: 180.0,
                              height: 180.0,
                              child: Icon(
                                MdiIcons.accountMultiple,
                                color: podcast,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Podcast',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(color: onSecondary),
                              ),
                            ),
                            Text(
                              '20',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(color: onSecondary),
                            )
                          ],
                        )
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: primary),
                    margin: margin,
                    padding: padding,
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: onVodcast,
                          child: ClipOval(
                            child: SizedBox(
                              width: 180.0,
                              height: 180.0,
                              child: Icon(
                                MdiIcons.videoWireless,
                                color: vodcast,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Vodcast',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(color: onSecondary),
                              ),
                            ),
                            Text(
                              '94',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(color: onSecondary),
                            )
                          ],
                        )
                      ],
                    )),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
