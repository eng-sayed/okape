
import 'package:flutter/material.dart';
import 'package:okape/chat_screen.dart';
import 'package:okape/services/firebase.dart';
import 'package:okape/widgets.dart';

import 'constants.dart';

class EnterName extends StatefulWidget {
  EnterName({Key key}) : super(key: key);

  @override
  _EnterNameState createState() => _EnterNameState();
}

class _EnterNameState extends State<EnterName> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Form(
        key: formkey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  validator: (s) {
                    if (s.isEmpty) {
                      return "Please Enter Your Name";
                    } else {
                      return null;
                    }
                  },
                  controller: controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Your Name To Start Chat"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FloatingActionButton.extended(
                  heroTag: null,
                  onPressed: () async {
                    if (formkey.currentState.validate()) {
                      await createUser(controller.text, token);
                      userName = controller.text;
                      Navigator.pop(context);
                      navto(ChatScreen(), context);
                    }
                  },
                  label: Text("Start Chat"))
            ],
          ),
        ),
      ),
    );
  }
}