import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../model/image_upload_response.dart';

class ImageUploadService {
  final Dio dio;

  ImageUploadService(this.dio);

  Future<ImageUploadResponse?> uploadImageToServer(
      Uint8List byteArray, String name,
      {void Function(int, int)? onSendProgress}) async {
    final response = await dio.post(
      'full%2F$name.png',
      data: byteArray,
      onSendProgress: onSendProgress,
    );
    if (response.statusCode == HttpStatus.ok) {
      if (response.data != null) {
        return ImageUploadResponse.fromJson(response.data);
      }
    }
    return null;
  }
}
