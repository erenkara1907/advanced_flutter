import 'package:flutter/material.dart';

part 'part_appbar.dart';

class PartOfLearn extends StatefulWidget {
  const PartOfLearn({Key? key}) : super(key: key);
  @override
// ignore: library_private_types_in_public_api
  _PartOfLearnState createState() => _PartOfLearnState();
}

class _PartOfLearnState extends State<PartOfLearn> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _PartOfAppbar(),
    );
  }
}
