import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/provider/entertainmentprovider.dart';
import 'package:audio_session/audio_session.dart';
import 'dart:developer';
import 'package:just_audio/just_audio.dart';
import 'package:http/http.dart' as http;
import 'package:musicplayer/widgets/clientdrawer_widget.dart';
import '../../model/user.dart';
import 'package:provider/provider.dart';

class MusiccliScreen extends StatefulWidget {
  MusiccliScreen({Key? key}) : super(key: key);

  @override
  State<MusiccliScreen> createState() => _MusiccliScreenState();
}

class _MusiccliScreenState extends State<MusiccliScreen>
    with WidgetsBindingObserver {
  bool _visible = true;
  double value = 0;
  AudioPlayer player = AudioPlayer();
  bool isEnabled = false;
  void initState() {
    _init();

    super.initState();
  }

  void onChangedDragEnd(data) async {
    if (!player.playing) {
      setState(() {
        value = data;
      });
      return;
    }
    setState(() {
      value = 0;
    });
  }

  void onChanged(data) async {
    setState(() {
      value = data;
    });
  }

  Future<void> _init() async {
    try {
      final session = await AudioSession.instance;

      await session.configure(const AudioSessionConfiguration.speech());

      player.playbackEventStream.listen((event) {},
          onError: (Object e, StackTrace stackTrace) {
        print('A stream error occurred: $e');
      });
      await player.setAudioSource(AudioSource.uri(Uri.parse(playerUrl)));
      if (!player.playing) {
        setState(() {
          player.play();
          isEnabled = true;
        });
      }
    } catch (e) {}
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log(state.toString());
    if (state == AppLifecycleState.paused) {
      player.stop();
    }
  }

  void animatedPlayer() {}
  @override
  Widget build(BuildContext context) {
    Future<String> getImage() async {
      String? currentToken = context.read<User>().token;
      Map<String, String> userHeader = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $currentToken'
      };
      http.Response res = await http.get(
          Uri.parse("http://www.avsoundstation.com/api/image-music-background"),
          headers: userHeader);
      return res.body;
    }

    return SafeArea(
      child: Scaffold(
        drawer: ClientDrawerWidget(currentSelected: musicRoute),
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
                              backgroundColor: background,
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: const Icon(
                                MdiIcons.menu,
                                color: onPrimary,
                              ),
                            ),
                          ),
                        ),
                        FutureBuilder<String>(
                            future: getImage(),
                            builder: (context, AsyncSnapshot<String> snapshot) {
                              return Flexible(
                                  flex: 3,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: snapshot.data == null
                                                ? AssetImage(
                                                        'assets/images/Train-Japan.gif')
                                                    as ImageProvider
                                                : NetworkImage(
                                                    snapshot.data as String))),
                                  ));
                            })
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'SM SUPERMALLS',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                        Slider(
                          value: value,
                          onChangeEnd: onChangedDragEnd,
                          onChanged: onChanged,
                        ),
                        GestureDetector(
                            onTap: () {
                              if (isEnabled) {
                                setState(() {
                                  if (player.playing) {
                                    player.pause();
                                  } else {
                                    setState(() {
                                      value = 0;
                                    });
                                    player.play();
                                  }
                                });
                              }
                            },
                            child: AnimatedOpacity(
                                // If the widget is visible, animate to 0.0 (invisible).
                                // If the widget is hidden, animate to 1.0 (fully visible).
                                opacity: _visible ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 500),
                                // The green box must be a child of the AnimatedOpacity widget.
                                child: Icon(
                                  player.playing
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  size: 32,
                                ))),
                      ],
                    ),
                  ),
                ),
              ]);
        }),
      ),
    );
  }
}
