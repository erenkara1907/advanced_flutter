// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../model/image_upload_response.dart';
import '../service/image_upload_service.dart';

part 'image_upload_view_model.g.dart';

class ImageUploadViewModel = _ImageUploadViewModelBase
    with _$ImageUploadViewModel;

abstract class _ImageUploadViewModelBase with Store {
  static const _baseUrl =
      'https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com/o/';

  @observable
  String imageUrl = '';
  @observable
  File? file;

  @observable
  bool isLoading = false;

  @observable
  String downloadText = '';

  ImageUploadService imageUploadService =
      ImageUploadService(Dio(BaseOptions(baseUrl: _baseUrl)));

  @action
  void uploadImageUrl(ImageUploadResponse? response) {
    if (response == null) return;

    imageUrl = '$_baseUrl${response.name?.replaceFirst('/', '%2f') ?? ''}';
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void updateDownloadText(int sent, int total) {
    downloadText = '$sent / $total';
  }

  @action
  void saveLocalFile(XFile? file) {
    if (file == null) return;
    this.file = File(file.path);
  }

  Future<void> saveDateToService() async {
    if (file == null) return;

    changeLoading();

    final response = await imageUploadService.uploadImageToServer(
      await file!.readAsBytes(),
      'vb',
      onSendProgress: (sent, total) {
        updateDownloadText(sent, total);
      },
    );
    uploadImageUrl(response);
  }
}
