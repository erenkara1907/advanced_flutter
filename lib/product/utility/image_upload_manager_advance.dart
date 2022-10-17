import 'package:image_picker/image_picker.dart';

abstract class IUploadImage {
  final ImagePicker picker = ImagePicker();
  Future<XFile?> get();
}

class ImageUploadManagerAdvance {
  final IUploadImage uploadImage;

  ImageUploadManagerAdvance(this.uploadImage);

  Future<XFile?> cropWithGet() async {
    return await uploadImage.get();
  }
}

class GalleryUploadImage extends IUploadImage {
  @override
  Future<XFile?> get() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}

class CameraUploadImage extends IUploadImage {
  @override
  Future<XFile?> get() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image;
  }
}
