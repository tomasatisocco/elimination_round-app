import 'package:hive/hive.dart';

import '../../../../core/errors/exceptions/local_persistance_exceptions.dart';
import '../models/round_model.dart';

abstract class MyShotsLocalDataSource {
  Future<List<RoundModel>?> getModelsInLocalDatasource();
}

class MyShotsLocalDataSourceImp implements MyShotsLocalDataSource {
  static const String boxName = 'round_models';

  @override
  Future<List<RoundModel>?> getModelsInLocalDatasource() async {
    List<RoundModel>? _roundModels = [];
    try {
      await Hive.openBox<RoundModel>(boxName);
      _roundModels = Hive.box(boxName).values.toList().cast<RoundModel>();
      Hive.box(boxName).close();
      return _roundModels;
    } catch (_) {
      throw ReadLocalPersistanceException();
    }
  }
}
