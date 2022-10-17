import 'dart:io';

import 'package:dio/dio.dart';

import '../model/resource_model.dart';

abstract class IReqresService {
  IReqresService(this.dio);
  final Dio dio;

  Future<ResourceModel?> getAllResourceItem();
}

enum _ReqResPath { resource }

class ReqresService extends IReqresService {
  ReqresService(super.dio);

  @override
  Future<ResourceModel?> getAllResourceItem() async {
    final response = await dio.get('/${_ReqResPath.resource.name}');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
