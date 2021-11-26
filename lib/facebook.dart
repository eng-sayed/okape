import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:okape/ads.dart';
import 'package:okape/main.dart';

Widget facebook(BuildContext context , void function) {
  // return WebviewScaffold(
  //   bottomNavigationBar: Ads(),
  //
  //   clearCookies: false,
  //   clearCache: false,
  //   url: 'https://www.facebook.com/alfanaanhamdysalman',
  //
  //   javascriptChannels: jsChannels,
  //   mediaPlaybackRequiresUserGesture: true,
  //   withZoom: true,
  //   withLocalStorage: true,
  //   hidden: true,
  //   withJavascript: true,
  //   primary: true,
  //   allowFileURLs: true,
  //   // withLocalUrl: true,
  //   scrollBar: false,
  //   appCacheEnabled: true,
  //   initialChild: Container(
  //     color: Colors.white,
  //     child: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           Image.asset(
  //             'images/ph.jpg',
  //             scale: .5,
  //           ),
  //           CircularProgressIndicator(),
  //         ],
  //       ),
  //     ),
  //   ),
  // );



  InAppWebViewController webViewController;

  Future<bool> _onWillPop(BuildContext context) async {
    if (await webViewController.canGoBack()) {
      webViewController.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
  Widget splash = Container(
    color: Colors.white,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'images/ph.jpg',
            scale: .5,
          ),
          CircularProgressIndicator(),
        ],
      ),
    ),
  );
 return WillPopScope(
   onWillPop: () => _onWillPop(context),
   child: Stack(
     children: [
            InAppWebView(
                onProgressChanged: (controller, progress) {
                  if (progress == 100) {
                    splash = SizedBox();
                    function;
                  //  setState(() {});
                  }
                },
        // contextMenu: contextMenu,
            initialUrlRequest: URLRequest(
                url: Uri.parse(
                    'https://www.facebook.com/alfanaanhamdysalman'
                  //
                )),
            // initialFile: "assets/index.html",
            initialUserScripts: UnmodifiableListView<UserScript>([]),
            onWebViewCreated: (controller) {
              webViewController = controller;
            }),
       splash
          ],
   ),
 );


}

class WebViewExample1 extends StatefulWidget {

  @override
  WebViewExample1State createState() => WebViewExample1State();
}
class WebViewExample1State extends State<WebViewExample1> {
  InAppWebViewController webViewController;

  Future<bool> _onWillPop(BuildContext context) async {
    if (await webViewController.canGoBack()) {
      webViewController.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  Widget splash = Container(
    color: Colors.white,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'images/ph.jpg',
            scale: .5,
          ),
          CircularProgressIndicator(),
        ],
      ),
    ),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: SafeArea(
          child: Stack(
            children: [
              InAppWebView(
                  onProgressChanged: (controller, progress) {
                    if (progress == 100) {
                      splash = SizedBox();
                      setState(() {});
                    }
                  },
                  // contextMenu: contextMenu,
                  initialUrlRequest: URLRequest(
                      url: Uri.parse( 'https://www.facebook.com/alfanaanhamdysalman'
                          )),
                  // initialFile: "assets/index.html",

                  onWebViewCreated: (controller) async {
                    webViewController = controller;
                  }),
              splash
            ],
          ),
        ),
      ),
    );
  }
}