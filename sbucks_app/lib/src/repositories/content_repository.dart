import 'package:sbucks/src/repositories/api_client.dart';
import 'package:sbucks/src/models/content_model.dart';
import 'package:sbucks/src/utils/constant.dart';
import 'package:sbucks/src/blocs/app_bloc.dart';

class ContentRepository {
  final _apiClient = ApiClient();

  Future<ContentsModel> content({int contentID, int contentTypeID}) async {
    final response = await _apiClient.getBasic(
      AppConstant.kGetContent,
      queryParams: {
        'contentID': contentID ?? '',
        'contentTypeID': contentTypeID ?? ''
      },
      accessToken: await appBloc.getToken(),
    );
    ContentsModel result = ContentsModel.fromJson(response);
    return result;
  }
}
