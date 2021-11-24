import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:okape/facebook.dart';
import 'package:okape/no_network.dart';
import 'package:okape/youtube_webview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}


// String selectedUrl = 'https://www.youtube.com/c/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9%D8%A7%D9%84%D8%B1%D8%B3%D9%85%D9%8A%D8%A9%D9%84%D9%84%D8%AD%D8%A7%D8%AC%D8%B9%D9%82%D8%A8%D9%8A';
final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'Print',
      onMessageReceived:
          (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();
class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  StreamSubscription<ConnectivityResult>
  internetconnection;
  bool isoffline = true;
  final flutterWebviewPlugin =
  new FlutterWebviewPlugin();
  Widget ui = Scaffold() ;

  @override
  void initState() {
    internetconnection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // whenevery connection status is changed.
      if (result == ConnectivityResult.none) {
        //there is no any connection
        setState(() {
          isoffline = true;
          ui = nonet(context);
        });
      } else if (result ==
          ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        //connection is from wifi
        setState(() {
          isoffline = false;
          ui = youtube();
        });
      }
    });




    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return ui ;
    // return Scaffold(
    //   // appBar: AppBar(
    //   //
    //   // ),
    //   drawer: Drawer(
    //     // Add a ListView to the drawer. This ensures the user can scroll
    //     // through the options in the drawer if there isn't enough vertical
    //     // space to fit everything.
    //     child: ListView(
    //       // Important: Remove any padding from the ListView.
    //       padding: EdgeInsets.zero,
    //       children: [
    //         const DrawerHeader(
    //           decoration: BoxDecoration(
    //             color: Colors.blue,
    //           ),
    //           child: Text('Drawer Header'),
    //         ),
    //         ListTile(
    //           title: const Text('Item 1'),
    //           onTap: () {
    //             // Update the state of the app.
    //             // ...
    //           },
    //         ),
    //         ListTile(
    //           title: const Text('Item 2'),
    //           onTap: () {
    //             // Update the state of the app.
    //             // ...
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    //   body:Container(child: ui)
    // );
  }
}
