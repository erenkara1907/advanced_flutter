import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_exception.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);
  void toShare(String path) async {
    await launchUrl(Uri.parse(path));
  }
}

class FileDownload extends IFileDownload with ShareMixin {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    if (kDebugMode) {
      print('A');
    }

    return null;
  }

  void smsShare() {}
}

class SMSDownload implements IFileDownload{
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    if (kDebugMode) {
      print('A');
    }

    return null;
  }

  @override
  void toShare(String path) async {
    await launchUrl(Uri.parse('sms: $path'));
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

class ErenDownload {
  
}

mixin ShareMixin on IFileDownload {
  void toShowFile() {}
}
