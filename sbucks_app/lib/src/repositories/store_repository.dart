import 'package:sbucks/src/repositories/api_client.dart';
import 'package:sbucks/src/models/store_model.dart';
import 'package:sbucks/src/utils/constant.dart';
import 'package:sbucks/src/blocs/app_bloc.dart';

class StoreRepository {
  final _apiClient = ApiClient();

  Future<StoreModel> store({double latitude, double longitude}) async {
    final response = await _apiClient.getBasic(
      AppConstant.kStore,
      queryParams: {'latitude': latitude ?? '', 'longitude': longitude ?? ''},
      accessToken: await appBloc.getToken(),
    );
    StoreModel result = StoreModel.fromJson(response);
    return result;
  }
}
