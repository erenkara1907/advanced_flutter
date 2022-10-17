import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({Key? key}) : super(key: key);
  @override
// ignore: library_private_types_in_public_api
  _FormLearnViewState createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                return (value?.isNotEmpty ?? false)
                    ? null
                    : 'Bu alan boş geçilemez';
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    if (kDebugMode) {
                      print('Okay');
                    }
                  }
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}
