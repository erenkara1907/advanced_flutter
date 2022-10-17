// ignore_for_file: unused_local_variable

import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

import 'unkown_model.dart';

void main() {
  late final INetworkManager networkManager;
  setUp(() {
    networkManager = NetworkManager(
      options: BaseOptions(baseUrl: 'https://reqres.in/api'),
    );
  });
  test('Vexana Test', () async {
    final response = await networkManager.send<UnkownModel, UnkownModel>(
      '/unkown',
      parseModel: UnkownModel(),
      method: RequestType.GET,
    );
  });
}
