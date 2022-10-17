import 'package:flutter/material.dart';

import '../../303/call_back_learn.dart';

class CallBackDropdown extends StatefulWidget {
  const CallBackDropdown({Key? key, required this.onUserSelected})
      : super(key: key);
  final void Function(CallbackUser user) onUserSelected;
  @override
// ignore: library_private_types_in_public_api
  _CallBackDropdownState createState() => _CallBackDropdownState();
}

class _CallBackDropdownState extends State<CallBackDropdown> {
  CallbackUser? _user;

  void _updateUser(CallbackUser? item) {
    setState(() {
      _user = item;
    });

    if (_user != null) {
      widget.onUserSelected.call(_user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallbackUser>(
      value: _user,
      items: CallbackUser.dummyUsers().map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(
            e.name,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        );
      }).toList(),
      onChanged: _updateUser,
    );
  }
}
