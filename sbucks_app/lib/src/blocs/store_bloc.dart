import 'package:sbucks/src/models/api_response_model.dart';
import 'package:sbucks/src/models/content_model.dart';
import 'package:sbucks/src/repositories/store_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sbucks/src/models/store_model.dart';

class StoreBloc {
  final _storeRepository = StoreRepository();

  Future<ApiResponse<StoreModel>> fetchStore() async {
    try {
      final result = await _storeRepository.store();

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

StoreBloc storeBloc = StoreBloc();
