import 'package:sbucks/src/models/content_model.dart';

class AppGlobal {
  ContentsModel contentsModel;

  ContentsModel get contents {
    return contentsModel;
  }

  set contents(ContentsModel value) {
    this.contentsModel = value;
  }
}

AppGlobal appGlobal = AppGlobal();
