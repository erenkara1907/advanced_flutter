import 'package:vexana/vexana.dart';

import '../../../../../product/model/token_model.dart';
import '../model/login_model.dart';

abstract class ILoginService {
  ILoginService(this.networkManager);
  final INetworkManager networkManager;

  Future<IResponseModel<TokenModel?>?> login(LoginModel model);

  final String _loginPath = 'api/login';
}

class LoginService extends ILoginService {
  LoginService(super.networkManager);

  @override
  Future<IResponseModel<TokenModel?>?> login(LoginModel model) async {
    return await networkManager.send<TokenModel, TokenModel>(_loginPath,
        parseModel: TokenModel(), method: RequestType.POST, data: model);
  }
}
