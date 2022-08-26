import 'dart:io';
import 'package:community/network/network_config.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IntroducePage extends StatefulWidget {
  static const routeName = "/introduce";
  const IntroducePage({Key? key}) : super(key: key);

  @override
  State<IntroducePage> createState() => _IntroducePageState();
}

class _IntroducePageState extends State<IntroducePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introduce'),
      ),
      body: const WebView(
        initialUrl: "${HTTPConfig.baseURL}/web/community/content/1",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
