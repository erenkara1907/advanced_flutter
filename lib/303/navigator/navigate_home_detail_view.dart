import 'package:flutter/material.dart';

class NavigateHomeDetailView extends StatefulWidget {
  const NavigateHomeDetailView({Key? key, this.id}) : super(key: key);
  final String? id;
  @override
// ignore: library_private_types_in_public_api
  _NavigateHomeDetailViewState createState() => _NavigateHomeDetailViewState();
}

class _NavigateHomeDetailViewState extends State<NavigateHomeDetailView> {
  String? _id;
  @override
  void initState() {
    super.initState();

    _id = widget.id;

    if (_id == null) {
      Future.microtask(() {
        // ignore: no_leading_underscores_for_local_identifiers
        final _modelId = ModalRoute.of(context)?.settings.arguments;

        setState(() {
          _id = _modelId is String ? _modelId : widget.id;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).errorColor,
      appBar: AppBar(
        title: Text(_id ?? ''),
      ),
    );
  }
}
