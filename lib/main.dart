// import 'dart:async';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:okape/facebook.dart';
// import 'package:okape/no_network.dart';
// import 'package:okape/youtube_webview.dart';
// import 'package:okape/services/api.dart';
// import 'package:okape/services/firebase.dart';
// import 'package:okape/widgets.dart';
// import 'chat_screen.dart';
// import 'constants.dart';
// import 'enter_name.dart';
// import 'services/api.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   Diohelp.init();
//   MobileAds.instance.initialize();
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//   token = await messaging.getToken();
//   userName = await getUserName(token);
//   await messaging.subscribeToTopic('users');
//
//   notifacationHandel();
//
//   FirebaseMessaging.onBackgroundMessage(firebaseonbackground);
//
//   print(userName);
//   print(token);
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }
//
// // String selectedUrl = 'https://www.youtube.com/c/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9%D8%A7%D9%84%D8%B1%D8%B3%D9%85%D9%8A%D8%A9%D9%84%D9%84%D8%AD%D8%A7%D8%AC%D8%B9%D9%82%D8%A8%D9%8A';
// final Set<JavascriptChannel> jsChannels = [
//   JavascriptChannel(
//       name: 'Print',
//       onMessageReceived: (JavascriptMessage message) {
//         print(message.message);
//       }),
// ].toSet();
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   StreamSubscription<ConnectivityResult> internetconnection;
//   bool isoffline = true;
//   final flutterWebviewPlugin = new FlutterWebviewPlugin();
//   Widget ui = Scaffold();
//   TabController tabController;
//   GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
//   @override
//   void initState() {
//     internetconnection = Connectivity()
//         .onConnectivityChanged
//         .listen((ConnectivityResult result) {
//       // whenevery connection status is changed.
//       if (result == ConnectivityResult.none) {
//         //there is no any connection
//         setState(() {
//           isoffline = true;
//         //  ui = nonet(context);
//         });
//       } else if (result == ConnectivityResult.wifi ||
//           result == ConnectivityResult.mobile) {
//         //connection is from wifi
//         setState(() {
//           isoffline = false;
//          // ui = youtube();
//         });
//       }
//     });
//     tabController = TabController(vsync: this, length: 2);
//
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldkey,
//       floatingActionButton: FloatingActionButton(
//         child: Icon(
//           Icons.mail,
//         ),
//         onPressed: () {
//           userName.isEmpty
//               ? scaffoldkey.currentState.showBottomSheet((context) {
//                   return EnterName();
//                 })
//               : navto(ChatScreen(), context);
//         },
//       ),
//       backgroundColor: Colors.blue,
//       appBar: AppBar(
//         centerTitle: true,
//         title: TabBar(
//             controller: tabController,
//             indicatorPadding: EdgeInsets.zero,
//             tabs: [Tab(text: "youtube"), Tab(text: "facebook")]),
//       ),
//       body: TabBarView(
//           controller: tabController, children: [
//         isoffline ? nonet(context): youtube(),
//         isoffline ? nonet(context): facebook()]
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//




import 'dart:async';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import 'package:connectivity/connectivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:okape/adminchattest.dart';
import 'package:okape/chat_screen.dart';
import 'package:okape/constants.dart';
import 'package:okape/enter_name.dart';
import 'package:okape/facebook.dart';
import 'package:okape/no_network.dart';
import 'package:okape/services/api.dart';
import 'package:okape/services/firebase.dart';
import 'package:okape/widgets.dart';
import 'package:okape/youtube_webview.dart';

import 'ads.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Diohelp.init();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  token = await messaging.getToken();
  userName = await getUserName(token);
  await messaging.subscribeToTopic('users');

  notifacationHandel();

  FirebaseMessaging.onBackgroundMessage(firebaseonbackground);

  print(userName);
  print(token);
  runApp(MyApp());
}
String selectedUrl =
    'https://www.youtube.com/c/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9%D8%A7%D9%84%D8%B1%D8%B3%D9%85%D9%8A%D8%A9%D9%84%D9%84%D8%AD%D8%A7%D8%AC%D8%B9%D9%82%D8%A8%D9%8A';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الحاج عقبي',
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
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  StreamSubscription<ConnectivityResult> internetconnection;
  bool isoffline = true;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  Widget ui = Scaffold();
  TabController tabController;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

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
      } else if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        //connection is from wifi
        setState(() {
          isoffline = false;
          ui = youtube();
        });
      }
    });
    tabController = TabController(vsync: this, length: 2);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container
        (child: Ads(),
      width: double.infinity,),
      key: scaffoldkey,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.mail,
        ),
        onPressed: () {
          userName.isEmpty
              ? scaffoldkey.currentState.showBottomSheet((context) {
            return EnterName();
          })
              : navto(ChatScreen(), context);
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TabBar(
            controller: tabController,
           // padding: EdgeInsets.zero,
            tabs: [Tab(text: "youtube"), Tab(text: "facebook")]),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          isoffline ? nonet(context) : WebViewExample(),
          isoffline ? nonet(context) : WebViewExample1()
        ],
      ),
    );

  }
}


/*   Container(
                child: Column(
                  children: [
                    TextField(
                      onSubmitted: (s) {
                        createUser(s, token);
                      },
                    ),
                    TextField(
                      onSubmitted: (s) {
                        sendMessege(types.User(id: "admin"), s, token);
                      },
                    ), */