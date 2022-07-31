import 'package:flutter/material.dart';
import 'package:musicplayer/screens/auth/signin_screen.dart';
import 'package:musicplayer/screens/client/fblivecli_screen.dart';

import 'package:musicplayer/screens/client/musiccli_screen.dart';
import 'package:musicplayer/screens/client/podcastcli_screen.dart';
import 'package:musicplayer/screens/client/vodcastcli_screen.dart';

import 'constant.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case musicRoute:
      return MaterialPageRoute(builder: (_) => MusiccliScreen());
    case signinRoute:
      return MaterialPageRoute(builder: (_) => SigninScreen());
    case vodcastRoute:
      return MaterialPageRoute(builder: (context) => VodcastcliScreen());
    case podcastRoute:
      return MaterialPageRoute(builder: (context) => PodcastcliScreen());
    case fbliveRoute:
      return MaterialPageRoute(builder: (context) => FblivecliScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
