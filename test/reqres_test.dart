import 'package:dio/dio.dart';
import 'package:flutter_full_learn/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/reqres_resource/viewModel/reqres_provider.dart';
import 'package:flutter_full_learn/303/testable/user_save_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([ReqresProvider])
void main() {
  setUp(() {
    Map<String, Object> values = <String, Object>{'eren': 'Eren Kara'};
    SharedPreferences.setMockInitialValues(values);
  });
  // test('description', () {
  //   var mockProvider = ReqresProvider(ReqresService(Dio()));
  //   final resourceContext = ResourceContext();
  //   final result = mockProvider.saveToLocale(resourceContext);
  //   expect(result, []);
  // });

  test('userTest', () async {
    var userViewModel = UserSaveViewModel();
    final result = userViewModel.getReadData(
        'eren', SharedPrefStore(await SharedPreferences.getInstance()));
    expect(result, true);
  });

  test('fetchItems', () async {
    var mockProvider = ReqresProvider(MockReqResService());
    final result = await mockProvider.fetchItems();
    expect(result, isNotEmpty);
  });
}

class MockReqResService extends IReqresService {
  MockReqResService() : super(Dio());

  @override
  Future<ResourceModel?> getAllResourceItem() async {
    return ResourceModel(
      data: [
        const Data(color: 'a', id: 1),
      ],
    );
  }
}
