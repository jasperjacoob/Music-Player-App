import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/provider/entertainmentprovider.dart';
import 'package:audio_session/audio_session.dart';
import 'dart:developer';
import 'package:just_audio/just_audio.dart';
import 'package:musicplayer/widgets/clientdrawer_widget.dart';
import 'package:provider/provider.dart';

class MusiccliScreen extends StatefulWidget {
  MusiccliScreen({Key? key}) : super(key: key);

  @override
  State<MusiccliScreen> createState() => _MusiccliScreenState();
}

class _MusiccliScreenState extends State<MusiccliScreen>
    with WidgetsBindingObserver {
  AudioPlayer player = AudioPlayer();

  void initState() {
    super.initState();

    _init();
  }

  Future<void> _init() async {
    try {
      final session = await AudioSession.instance;

      await session.configure(const AudioSessionConfiguration.speech());

      player.playbackEventStream.listen((event) {},
          onError: (Object e, StackTrace stackTrace) {
        print('A stream error occurred: $e');
      });
      await player.setAudioSource(
          AudioSource.uri(Uri.parse("http://stream.zeno.fm/a788tyayyuhvv")));
      if (!player.playing) {
        await player.play();
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
