import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:developer';

class EntertainmentProvider extends ChangeNotifier {
  AudioPlayer? player;

  void setPlayer(AudioPlayer player) {
    this.player = player;
  }
}
