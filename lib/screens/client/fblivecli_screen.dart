import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicplayer/constant.dart';

import 'package:musicplayer/screens/auth/loading_screen.dart';
import 'package:musicplayer/widgets/clientappbar_widget.dart';
import 'package:musicplayer/widgets/clientdrawer_widget.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../model/user.dart';

class FblivecliScreen extends StatefulWidget {
  FblivecliScreen({Key? key}) : super(key: key);

  @override
  State<FblivecliScreen> createState() => _FblivecliScreenState();
}

class _FblivecliScreenState extends State<FblivecliScreen> {
  void initState() {
    super.initState();

    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    Future<String> init() async {
      String? currentToken = context.read<User>().token;
      Map<String, String> userHeader = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $currentToken'
      };
      http.Response res = await http.get(
          Uri.parse("http://www.avsoundstation.com/api/fb-live"),
          headers: userHeader);
      Map<String, dynamic> resMes = jsonDecode(res.body);

      if (resMes.containsKey("message")) {
        return resMes['message'];
      }

      resMes["link"] =
          resMes["link"].replaceAll(RegExp('height="[0-9]+"'), 'height="100%"');
      resMes["link"] =
          resMes["link"].replaceAll(RegExp('width="[0-9]+"'), 'width="100%"');

      return resMes['link'];
    }

    return FutureBuilder(
        future: init(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          debugPrint(snapshot.data);
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.toString().contains("No FB Live Event")) {
              return Scaffold(
                drawer: ClientDrawerWidget(currentSelected: fbliveRoute),
                appBar: ClientAppBar(title: "Fb Live"),
                body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 22.0),
                      child: Text(snapshot.data.toString(),
                          style: Theme.of(context).textTheme.headline2),
                    )
                  ],
                ),
              );
            } else {
              return OrientationBuilder(builder: (context, orientation) {
                orientation == Orientation.portrait
                    ? SystemChrome.setEnabledSystemUIMode(
                        SystemUiMode.manual,
                        overlays: [
                          SystemUiOverlay
                              .top, // Shows Status bar and hides Navigation bar
                          SystemUiOverlay.bottom
                        ],
                      )
                    : SystemChrome.setEnabledSystemUIMode(
                        SystemUiMode.immersiveSticky);

                return Scaffold(
                  drawer: ClientDrawerWidget(currentSelected: fbliveRoute),
                  appBar: orientation == Orientation.portrait
                      ? ClientAppBar(title: "Fb Live")
                      : null,
                  body: Padding(
                    padding: orientation == Orientation.landscape
                        ? EdgeInsets.zero
                        : EdgeInsets.only(top: 50),
                    child: FractionallySizedBox(
                      heightFactor:
                          orientation == Orientation.landscape ? 1 : 0.5,
                      child: WebView(
                        javascriptMode: JavascriptMode.unrestricted,
                        zoomEnabled: false,
                        onWebViewCreated: ((controller) => {}),
                        initialUrl: Uri.dataFromString(
                                '<html><body style="margin:0,padding:0">${snapshot.data}</body></html>',
                                base64: true,
                                mimeType: 'text/html')
                            .toString(),
                      ),
                    ),
                  ),
                );
              });
            }
          }
          return LoadingScreen();
        });
  }
}
