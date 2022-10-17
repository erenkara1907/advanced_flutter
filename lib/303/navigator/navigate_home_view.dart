import 'package:flutter/material.dart';
import '../../product/mixin/navigator_mixin.dart';
import '../../product/navigator/navigator_routes.dart';

class NavigateHomeview extends StatefulWidget {
  const NavigateHomeview({Key? key}) : super(key: key);
  @override
// ignore: library_private_types_in_public_api
  _NavigateHomeviewState createState() => _NavigateHomeviewState();
}

class _NavigateHomeviewState extends State<NavigateHomeview>
    with NavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () async {
          await router.pushToPage(NavigateRoutes.detail, arguments: 'ErenK');
        },
        child: const Icon(Icons.person_rounded),
      ),
      appBar: AppBar(
        title: Text(toString()),
      ),
    );
  }
}
