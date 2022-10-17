import 'package:image_picker/image_picker.dart';

mixin ImageUploadManager {
  final ImagePicker _picker = ImagePicker();

  // Image Cropper bağlayabilirsin
  Future<XFile?> getFromLibrary() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    return image;
  }

  Future<XFile?> getFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    return image;
  }

  // Future<void> _cropImage(String filePath) async {
  //   CroppedFile? _croppedImage = await ImageCropper.platform.cropImage(
  //     sourcePath: filePath,
  //     maxWidth: 1080,
  //     maxHeight: 1080,
  //   );

  //   if (_croppedImage != null) {
  //     imageFile = _croppedImage;
  //   }
  // }
}




