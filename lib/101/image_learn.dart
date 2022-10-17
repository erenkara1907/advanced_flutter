import 'package:flutter/material.dart';

class ImageItems {
  final String appleWithSchoolWithoutPath = 'apple_with_school';
}

class PngImage extends StatelessWidget {
  final String name;

  const PngImage({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameWithPath,
      fit: BoxFit.cover,
    );
  }

  String get _nameWithPath => 'assets/png/$name.png';
}
