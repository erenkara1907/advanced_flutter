// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../product/utility/image_upload_manager_advance.dart';

class ImagePickerGenericView extends StatefulWidget {
  const ImagePickerGenericView({Key? key}) : super(key: key);
  @override
// ignore: library_private_types_in_public_api
  _ImagePickerGenericViewState createState() => _ImagePickerGenericViewState();
}

class _ImagePickerGenericViewState extends State<ImagePickerGenericView> {
  late final _imageUploadAdvance;

  @override
  void initState() {
    super.initState();
    _imageUploadAdvance = ImageUploadManagerAdvance(GalleryUploadImage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () => _imageUploadAdvance.cropWithGet(),
              child: const Text('Get from gallery')),
          ElevatedButton(
              onPressed: () => _imageUploadAdvance.cropWithGet(),
              child: const Text('Get from normal')),
          ElevatedButton(
              onPressed: () {}, child: const Text('Get from multiple')),
        ],
      ),
    );
  }
}
