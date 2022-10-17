import 'package:flutter/material.dart';
import 'color_demos_view.dart';

class ColorLifeCycle extends StatefulWidget {
  const ColorLifeCycle({Key? key}) : super(key: key);
  @override
// ignore: library_private_types_in_public_api
  _ColorLifeCycleState createState() => _ColorLifeCycleState();
}

class _ColorLifeCycleState extends State<ColorLifeCycle> {
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: _changeBackgroundColor, icon: const Icon(Icons.clear))
        ],
      ),
      body: Column(
        children: [
          const Spacer(),
          Expanded(
              child: ColorDemos(
            initialColor: _backgroundColor,
          ))
        ],
      ),
    );
  }

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = Colors.pink;
    });
  }
}
