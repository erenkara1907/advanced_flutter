// ignore_for_file: unused_field

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'post_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<List<PostModel>?> fetchPostItemsAdvance();
}

class PostService implements IPostService {
  final Dio _networkManager;
  PostService()
      : _networkManager =
            Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    final response = await _networkManager.post(_PostServicePaths.posts.name,
        data: postModel);

    return response.statusCode == HttpStatus.created;
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await _networkManager.get(_PostServicePaths.posts.name);

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        if (datas is List) {
          return datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (e) {
      _ShowDebug.showDioError(e);
    }
    return null;
  }
}

enum _PostServicePaths { posts, comments }

class _ShowDebug {
  static void showDioError(DioError error) {
    if (kDebugMode) {
      print(error.message);
    }
  }
}
