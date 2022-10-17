import 'package:flutter/material.dart';
import 'state_learn_view_model.dart';

class StateManageLearn extends StatefulWidget {
  const StateManageLearn({Key? key}) : super(key: key);
  @override
// ignore: library_private_types_in_public_api
  _StateManageLearnState createState() => _StateManageLearnState();
}

class _StateManageLearnState extends StateLearnViewModel { 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        changeVisible();
      }),
      appBar: AppBar(
        backgroundColor: isOpacity ? Colors.red : Colors.green,
        shadowColor: isVisible ? Colors.amber : Colors.grey,
      ),
    );
  }
}
