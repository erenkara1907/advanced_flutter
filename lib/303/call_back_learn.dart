import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../product/widget/button/answer_button.dart';
import '../product/widget/button/loading_button.dart';
import '../product/widget/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({Key? key}) : super(key: key);
  @override
// ignore: library_private_types_in_public_api
  _CallBackLearnState createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDropdown(onUserSelected: (CallbackUser user) {
            if (kDebugMode) {
              print(user);
            }
          }),
          AnswerButton(
            onNumber: (number) => number % 3 == 1,
          ),
          LoadingButton(
              title: 'Save',
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 1));
              })
        ],
      ),
    );
  }
}

class CallbackUser {
  final String name;
  final int id;

  CallbackUser(this.name, this.id);

  // ignore: todo
  // TODO: Dummy Remove it
  static List<CallbackUser> dummyUsers() {
    return [
      CallbackUser('Eren', 1),
      CallbackUser('Eren 2', 2),
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallbackUser && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
