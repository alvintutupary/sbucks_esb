import 'package:sbucks/src/repositories/api_client.dart';
import 'package:sbucks/src/models/menu_model.dart';
import 'package:sbucks/src/utils/constant.dart';
import 'package:sbucks/src/blocs/app_bloc.dart';

class MenuRepository {
  final _apiClient = ApiClient();

  Future<MenusModel> menu({double latitude, double longitude}) async {
    final response = await _apiClient.getBasic(
      AppConstant.kMenu,
      queryParams: {'latitude': latitude ?? '', 'longitude': longitude ?? ''},
      accessToken: await appBloc.getToken(),
    );
    MenusModel result = MenusModel.fromJson(response);
    return result;
  }
}
