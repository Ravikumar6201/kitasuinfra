// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // primarySwatch:
          ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false, // Disable debug banner
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    // ..loadFile()
    ..setBackgroundColor(const Color(0x00000000))
    ..setUserAgent
    ..enableZoom(mounted)
    ..clearLocalStorage()
    ..removeJavaScriptChannel
    ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url
            .startsWith('https://mlm.thewholesalesmart.com/public/login/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
    )
    ..loadRequest(Uri.parse('https://mlm.thewholesalesmart.com/public/login/'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: WebViewWidget(controller: _controller),
        ),
      ),
    );
  }
}
