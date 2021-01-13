// import 'package:sbucks/environment_config.dart';

class AppConstant {
  static const kUrlPaymentCallback = 'qoqicoid://main/payment';
  static const kUrlOrderScreen = 'qoqicoid://main/order';
  static const kAppStoreId = '1534721340';

  // static const kEnableLogEvent = EnvironmentConfig.LOG_EVENTS;

  static const kNumberFormat = '#.##0';

  // static const kValueFormat = '#,##0.00'

  static const kMenuNavModeCategory = 0;
  static const kMenuNavModeCategoryDetail = 1;
  static const kMenuNavModeMenu = 2;

  static const kCourierTypeInternal = 0;
  static const kCourierTypeGoSend = 1;
  static const kCourierTypeShipper = 2;
  static const kCourierTypeLalamove = 3;

  static const kOrderDataSalesType = 'QOQI APPS';

  static const kPreferenceIsFirstRun = 'IS_FIRST_RUN';
  static const kPreferenceUserToken = 'USER_TOKEN';
  static const kPreferenceSavedOrderData = 'SAVED_ORDER_DATA';

  static const kCSWAUrl = '6285289000790';
  static const kPrivacyPolicyUrl = 'https://qoqi.co.id/kebijakan-privasi.html';
  static const kTermsConditionUrl = 'https://qoqi.co.id/syarat-ketentuan.html';
  static const kFaq = 'https://qoqi.co.id/syarat-ketentuan.html';
  static const kContactUs = 'https://qoqi.co.id/syarat-ketentuan.html';

  // static const kHttpBaseUrl = EnvironmentConfig.API_URL;
  // static const kHttpBaseUrl = 'https://qoqi.co.id/api/web/';
  // static const kHttpBaseUrl = 'https://dev.esb.co.id:8000/ezota/api/web';
  static const kBasicUsername = 'ESB2020';
  static const kBasicPassword = 'AC97uhfd3t834jc83pk97ttjtujf4';

  static const kGetBanner = 'v1/banner/banner-list';
  static const kGetBannerBranch = 'v1/banner/banner-outlet-list';
  static const kGetBranch = 'v1/home/get-outlet-list';
  static const kBrandCategory = 'v1/home/get-brand-category';
  static const kGetVersionIOS = 'v1/version/qoqi-ios';
  static const kGetVersionAndroid = 'v1/version/qoqi-android';

  static const kGetBranchData = 'v1/setting/get-branch-data';
  static const kGetMenu = 'v1/menu';
  static const kGetTerms = 'v1/setting/get-terms';
  static const kGetPromotion = 'v1/promotion/get-promotion';
  static const kValidatePromotion = 'v1/promotion/validate';
  static const kValidateVoucher = 'v1/voucher/validate';
  static const kValidateBusinessHour = 'v1/branch/validate-business-hour';
  static const kValidatePaymentMethod =
      'v1/promotion/validate-promotion-self-order-payment';
  static const kGetBranchMenu = 'v1/menu/get-branch-menu-qty';

  static const kCalculateTotal = 'v1/order/calculate-total';
  static const kUpdateBranchMenu = 'v1/menu/update-branch-menu-qty';
  static const kCreatePayment = 'customer/payment/create';
  static const kUsePromotion = 'v1/promotion/use-promotion';
  static const kClaimVoucher = 'v1/voucher/claim';
  static const kValidateSpecialPriceUsage = 'v1/menu/validate-usage-menu-qty';
  static const kSaveSpecialPriceUsage = 'v1/menu/save-usage-menu-qty';
  static const kValidateOvoTransaction = 'v1/payment/validate-ovo';
  static const kValidateTransaction = 'v1/payment/validate';

  static const kGetOutstandingOrder = 'customer/order/outstanding-order';
  static const kGetOrderHistory = 'v1/order/get-order-history';
  static const kGetPaymentData = 'v1/payment/get-payment-data';
  static const kGetOrderStatus = 'v1/order/get-order-status';

  static const kMapAutocomplete = 'v1/map/autocomplete';
  static const kMapPlaceDetail = 'v1/map/place';
  static const kValidateRadius = 'v1/map/radius-validate';
  static const kValidateDelvieryCourier = 'v1/map/delivery-courier-validate';
  static const kMapGeocode = 'v1/map/geocode-get-address';
  static const kDeliveryEstimation = 'v1/third-party/get-delivery-cost';
  static const kGetDistance = 'v1/map/get-distance';

  static const kLogin = 'customer/user/login';
  static const kRegister = 'customer/user/register';
  static const kValidatePhoneNumber = 'customer/user/check-phone-number';
  static const kRequestOtp = 'customer/user/generate-otp';
  static const kValidateOtp = 'customer/user/validate-otp';
  static const kGetProfile = 'customer/user/get-profile';
  static const kRequestResetPin = 'customer/user/request-reset-pin';
  static const kResetPin = 'customer/user/reset-pin';
  static const kEditPin = 'customer/user/update-pin';
  static const kEditProfile = 'customer/user/update-profile';
  static const kLogout = 'customer/user/logout';
  static const kListNotification = 'customer/inbox/get-list-notification';
  static const kNotificationDetail = 'customer/inbox/get-content';
  static const kListActivies = 'customer/order/get-order-history';
  static const kResendEmailVerification = 'customer/user/resend-email';
  static const kSaveAddress = 'customer/delivery-address/save';
  static const kDeleteAddress = 'customer/delivery-address/delete';
  static const kGetSavedAddress = 'customer/delivery-address/list';
  static const kGetRecentUsedAddress =
      'customer/delivery-address/list-from-order';
  static const kMapSearch = 'customer/delivery-address/autocomplete';
}
