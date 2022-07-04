import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/clientdrawer_widget.dart';

class MusiccliScreen extends StatefulWidget {
  MusiccliScreen({Key? key}) : super(key: key);

  @override
  State<MusiccliScreen> createState() => _MusiccliScreenState();
}

class _MusiccliScreenState extends State<MusiccliScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: ClientDrawerWidget(),
        backgroundColor: primary,
        body: Builder(builder: (context) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: FloatingActionButton(
                              backgroundColor: onPrimary,
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: const Icon(
                                MdiIcons.menu,
                                color: secondary,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 3,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Train-Japan.gif'))),
                            ))
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                  ),
                ),
              ]);
        }),
      ),
    );
  }
}
