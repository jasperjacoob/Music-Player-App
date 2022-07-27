import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/clientdrawer_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PodcastcliScreen extends StatefulWidget {
  PodcastcliScreen({Key? key}) : super(key: key);

  @override
  State<PodcastcliScreen> createState() => _PodcastcliScreenState();
}

class _PodcastcliScreenState extends State<PodcastcliScreen> {
  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: background,
          drawer: ClientDrawerWidget(),
          body: Builder(builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: const Icon(MdiIcons.menu),
                  ),
                ),
                StreamBuilder<Object>(
                    stream: null,
                    builder: (context, snapshot) {
                      return Expanded(
                          child: WebView(
                        zoomEnabled: false,
                        onWebViewCreated:
                            (WebViewController webViewController) {
                          _controller = webViewController;
                          _controller?.loadUrl(Uri.dataFromString(
                                  '<html><body><iframe src="https://www.facebook.com/plugins/video.php?height=476&href=https%3A%2F%2Fwww.facebook.com%2Fghostwrecker28%2Fvideos%2F5178525435559780%2F&show_text=false&width=476&t=0" width="100%" height="100%" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share" allowFullScreen="true"></iframe></body></html>',
                                  mimeType: 'text/html',
                                  encoding: Encoding.getByName('utf-8'))
                              .toString());
                        },
                        initialUrl: "",
                        javascriptMode: JavascriptMode.unrestricted,
                      ));
                    }),
              ],
            );
          })),
    );
  }
}
