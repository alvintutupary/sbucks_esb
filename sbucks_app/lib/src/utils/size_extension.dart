import 'package:sbucks/src/utils/size_config.dart';

extension SizeExtension on num {
  num get scw => SizeConfig.width(this);

  num get sch => SizeConfig.height(this);

  num get scs => SizeConfig.size(this);
}
