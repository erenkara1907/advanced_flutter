// ignore_for_file: unused_element

import 'package:flutter/material.dart';

import 'post_model.dart';
import 'post_service.dart';

class ServicePostLearnView extends StatefulWidget {
  const ServicePostLearnView({Key? key}) : super(key: key);
  @override
// ignore: library_private_types_in_public_api
  _ServicePostLearnViewState createState() => _ServicePostLearnViewState();
}

class _ServicePostLearnViewState extends State<ServicePostLearnView> {
  String? name;
  bool _isLoading = false;

  late final PostService _postService;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _postService = PostService();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ''),
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
      ),
      body: Column(
        children: [
          TextField(
              controller: _titleController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Title')),
          TextField(
              controller: _bodyController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Body')),
          TextField(
            controller: _userIdController,
            autofillHints: const [AutofillHints.creditCardNumber],
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(labelText: 'UserId'),
          ),
          TextButton(
              onPressed: _isLoading
                  ? null
                  : () {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty &&
                          _userIdController.text.isNotEmpty) {
                        PostModel model = PostModel(
                            body: _bodyController.text,
                            title: _titleController.text,
                            userId: int.tryParse(_userIdController.text));

                        _postService.addItemToService(model);
                      }
                    },
              child: const Text('Send')),
        ],
      ),
    );
  }
}
