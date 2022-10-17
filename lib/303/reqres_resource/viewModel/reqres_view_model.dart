import '../../../202/cache/shared_learn_cache.dart';
import '../model/resource_model.dart';
import '../service/reqres_service.dart';
import '../../../product/service/project_network_manager.dart';

import '../view/reqres_view.dart';

abstract class ReqResViewModel extends LoadingStatefull<ReqresView> {
  late final IReqresService reqresService;

  List<Data> resources = [];

  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(ProjectNetworkManager.instance.service);
    ProjectNetworkManager.instance.addBaseHeaderToToken('Eren');
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.getAllResourceItem())?.data ?? [];
    changeLoading();
  }
}
