import 'package:flutter/material.dart';
import '../service/reqres_service.dart';
import '../../../product/global/resource_context.dart';

import '../model/resource_model.dart';

class ReqresProvider extends ChangeNotifier {
  ReqresProvider(this.reqresService) {
    _fetch();
  }
  final IReqresService reqresService;

  List<Data> resources = [];
  bool isLoading = false;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = await fetchItems();
    changeLoading();
  }

  Future<List<Data>> fetchItems() async {
    return (await reqresService.getAllResourceItem())?.data ?? [];
  }

  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}
