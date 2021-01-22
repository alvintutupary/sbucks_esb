import 'package:sbucks/src/models/api_response_model.dart';
import 'package:sbucks/src/models/content_model.dart';
import 'package:sbucks/src/repositories/content_repository.dart';
import 'package:rxdart/rxdart.dart';

class ContentBloc {
  final _contentRepository = ContentRepository();
  final _contentList = BehaviorSubject<ApiResponse<ContentsModel>>();
  final _isLoading = BehaviorSubject<bool>.seeded(false);
  List<ContentModel> _contentsModel;

  List<ContentModel> get contents {
    return _contentsModel;
  }

  set contents(List<ContentModel> value) {
    this._contentsModel = value;
  }

  Stream<ApiResponse<ContentsModel>> get contentList => _contentList.stream;

  Future<void> fetchContent() async {
    _contentList.add(ApiResponse.loading());
    try {
      final result = await _contentRepository.content();
      _contentList.add(ApiResponse.complete(result));
    } catch (e) {
      print('Error: ${e.toString()}');
      _contentList.add(ApiResponse.error(e.toString()));
    }
  }

  Future<ApiResponse<ContentModel>> fetchContentbyId(int contentID) async {
    try {
      final result = await _contentRepository.content();

      if (result != null) {
        return ApiResponse.complete(result.content[0][0]);
      } else {
        return ApiResponse.error('TRY_AGAIN_LATER');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      return ApiResponse.error(e.toString());
    }
  }

  // Future<ApiResponse<List<ContentModel>>> fetchContentbyType(
  //     int contentTypeID) async {
  //   try {
  //     final result =
  //         await _contentRepository.content(contentTypeID: contentTypeID);

  //     if (result != null) {
  //       return ApiResponse.complete(result.content[0]);
  //     } else {
  //       return ApiResponse.error('TRY_AGAIN_LATER');
  //     }
  //   } catch (e) {
  //     print('Error: ${e.toString()}');
  //     return ApiResponse.error(e.toString());
  //   }
  // }

  Future<ApiResponse<List<ContentModel>>> fetchContentbyType(
      int contentTypeID) async {
    try {
      final result =
          await _contentRepository.content(contentTypeID: contentTypeID);

      if (result != null) {
        return ApiResponse.complete(result.content[0]);
      } else {
        return ApiResponse.error('TRY_AGAIN_LATER');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      return ApiResponse.error(e.toString());
    }
  }

  Stream<bool> get isLoading => _isLoading.stream;
  void setLoading(bool isLoading) {
    _isLoading.add(isLoading);
  }

  void dispose() {
    _contentList.close();
    _isLoading.close();
  }
}

ContentBloc contentBloc = ContentBloc();
