import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:okape/constants.dart';
import 'package:okape/services/firebase.dart';

import 'constants.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _user = types.User(id: token, firstName: userName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: getChat(token),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return Chat(
              messages: snapshot.data.docs
                  .map((e) => types.Message.fromJson(e.data()))
                  .toList(),
              onSendPressed: (PartialText) {
                sendMessege(_user, PartialText.text, "admin");
              },
              user: _user,
              showUserAvatars: true,
              theme: DefaultChatTheme(),
              showUserNames: true,
            );
          }),
    );
  }
}