import 'package:sbucks/src/models/api_response_model.dart';
import 'package:sbucks/src/models/content_model.dart';
import 'package:sbucks/src/repositories/content_repository.dart';
import 'package:rxdart/rxdart.dart';

class ContentBloc {
  final _contentRepository = ContentRepository();
  final _contentList = BehaviorSubject<ApiResponse<ContentsModel>>();
  final _isLoading = BehaviorSubject<bool>.seeded(false);
  List<ContentModel> _contentsModel;
  List<ContentModel> _welcomeScreenContents;
  List<ContentModel> _loginContents;
  List<ContentModel> _directMarketingContents;
  List<ContentModel> _tacContents;
  List<ContentModel> _whatsNewsContents;
  List<ContentModel> _carouselImagesContents;
  List<ContentModel> _rewardBenefitContents;
  List<ContentModel> _faqContents;
  List<ContentModel> _lostCardReasonContents;
  List<ContentModel> _contactUsContents;
  List<ContentModel> _privacyContents;

  List<ContentModel> get contents {
    return _contentsModel;
  }

  set contents(List<ContentModel> value) {
    this._contentsModel = value;
  }

  List<ContentModel> get welcomeScreenContents {
    return _welcomeScreenContents;
  }

  set welcomeScreenContents(List<ContentModel> value) {
    this._contentsModel = value;
  }

  List<ContentModel> get loginContents {
    return _loginContents;
  }

  set loginContents(List<ContentModel> value) {
    this._contentsModel = value;
  }

  List<ContentModel> get directMarketingContents {
    return _directMarketingContents;
  }

  set directMarketingContents(List<ContentModel> value) {
    this._contentsModel = value;
  }

  List<ContentModel> get tacContents {
    return _tacContents;
  }

  set tacContents(List<ContentModel> value) {
    this._contentsModel = value;
  }

  List<ContentModel> get whatsNewsContents {
    return _whatsNewsContents;
  }

  set whatsNewsContents(List<ContentModel> value) {
    this._contentsModel = value;
  }

  List<ContentModel> get carouselImagesContents {
    return _carouselImagesContents;
  }

  set carouselImagesContents(List<ContentModel> value) {
    this._contentsModel = value;
  }

  List<ContentModel> get rewardBenefitContents {
    return _rewardBenefitContents;
  }

  set rewardBenefitContents(List<ContentModel> value) {
    this._contentsModel = value;
  }

  List<ContentModel> get faqContents {
    return _faqContents;
  }

  set faqContents(List<ContentModel> value) {
    this._contentsModel = value;
  }

  List<ContentModel> get lostCardReasonContents {
    return _lostCardReasonContents;
  }

  set lostCardReasonContents(List<ContentModel> value) {
    this._contentsModel = value;
  }

  List<ContentModel> get contactUsContents {
    return _contactUsContents;
  }

  set contactUsContents(List<ContentModel> value) {
    this._contentsModel = value;
  }

  List<ContentModel> get privacyContents {
    return _privacyContents;
  }

  set privacyContents(List<ContentModel> value) {
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
      final result = await _contentRepository.content(contentID: contentID);

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
      throw ApiResponse.error(e.toString());
    }
  }
}

ContentBloc contentBloc = ContentBloc();
