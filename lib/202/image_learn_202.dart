import 'package:flutter/material.dart';
import '../product/global/resource_context.dart';
import 'package:provider/provider.dart';

class ImageLearn extends StatefulWidget {
  const ImageLearn({Key? key}) : super(key: key);
  @override
// ignore: library_private_types_in_public_api
  _ImageLearnState createState() => _ImageLearnState();
}

class _ImageLearnState extends State<ImageLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<ResourceContext>().clear();
              },
              icon: const Icon(Icons.remove))
        ],
        title: Text(
            context.read<ResourceContext>().model?.data?.length.toString() ??
                ''),
      ),
      body: ImagePaths.apple_with_school.toWiget(height: 300.0),
    );
  }
}

// ignore: constant_identifier_names
enum ImagePaths { apple_with_school }

extension ImagePathExtension on ImagePaths {
  String path() {
    return 'assets/png/$name.png';
  }

  Widget toWiget({double height = 24.0}) {
    return Image.asset(
      path(),
      height: height,
    );
  }
}
