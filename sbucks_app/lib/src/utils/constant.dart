import 'package:sbucks/environment_config.dart';

class AppConstant {
  //Shared Preference Key
  static const kPreferenceIsFirstRun = 'IS_FIRST_RUN';
  static const kPreferenceUserPin = 'USER_PIN';
  static const kPreferenceUserToken = 'USER_TOKEN';

  static const kHttpBaseUrl = EnvironmentConfig.API_URL;

  //Authentication contentTypeId
  static const kWelcomeScreen = 1;
  static const kLoginContent = 2;
  static const kDirectMarketing = 3;
  static const kWhatsNew = 5;
  static const kCarouselImages = 6;
  static const kRewardBenefit = 7;
  static const kLostCard = 9;
  static const kFaqId = 8;
  static const kTacId = 3;
  static const kContactUsId = 10;
  static const kPrivacyId = 9;

  //Authentication
  static const kLogin = '/v1/auth/login';
  static const kRequestOtp = '/v1/auth/generate-otp';
  static const kValidateOtp = '/v1/auth/validate-otp';

  //Assets
  static const kEmptyImage = 'assets/img/empty-banner-image.png';

  //Content End-Point
  static const kGetContent = '/v1/content';
  static const kGetContentType = '/v1/content/get-content-type';

  //Campaign End-Point
  static const kCampaign = '/v1/campaign';
  static const kCampaignType = '/v1/campaign/get-campaign-type';

  //TopUp End-Point
  static const kTopUpSuggestion = '/v1/top-up-suggestion';

  //TopUp End-Point
  static const kMenu = '/v1/menu';

  //TopUp End-Point
  static const kStore = '/v1/store';

  //Other Variables
  static const kSecretKey = 'abc123';
  static const kAccessToken = 'rQwjaue2qAcitUvDwBZ3ZacGvjq6OP-S_1611078735';
}
