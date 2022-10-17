import 'package:flutter/material.dart';
import 'oop_learn.dart';

class OOPLearnView extends StatefulWidget {
  const OOPLearnView({Key? key}) : super(key: key);
  @override
// ignore: library_private_types_in_public_api
  _OOPLearnViewState createState() => _OOPLearnViewState();
}

class _OOPLearnViewState extends State<OOPLearnView> {
  @override
  void initState() {
    super.initState();
    fileDownload = FileDownload();
  }

  FileDownload? fileDownload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [CircularProgressIndicator.adaptive()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fileDownload?.downloadItem(null);
        },
      ),
    );
  }
}
