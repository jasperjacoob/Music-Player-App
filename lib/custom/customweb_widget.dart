import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebView extends StatefulWidget {
  String orientation;
  CustomWebView({super.key, required this.orientation});

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  @override
  Widget build(BuildContext context) {
    print(widget.orientation);
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: ((controller) => {}),
      initialUrl: Uri.dataFromString(
              '<iframe width="100%" height="100%" src="https://www.youtube.com/embed/5NwUyE4aSMY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>',
              base64: true,
              mimeType: 'text/html')
          .toString(),
    );
  }
}
