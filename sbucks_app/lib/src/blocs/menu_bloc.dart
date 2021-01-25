import 'package:sbucks/src/models/api_response_model.dart';
import 'package:sbucks/src/models/menu_model.dart';
import 'package:sbucks/src/repositories/menu_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sbucks/src/models/menu_model.dart';

class MenuBloc {
  final _menuRepository = MenuRepository();

  Future<ApiResponse<MenusModel>> fetchMenu() async {
    try {
      final result = await _menuRepository.menu();

      if (result != null) {
        return ApiResponse.complete(result);
      } else {
        return ApiResponse.error('TRY_AGAIN_LATER');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      return ApiResponse.error(e.toString());
    }
  }
}

MenuBloc menuBloc = MenuBloc();
