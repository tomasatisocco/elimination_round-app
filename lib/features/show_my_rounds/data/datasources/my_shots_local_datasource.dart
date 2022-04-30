import 'package:elemination_round_app/core/errors/exceptions/local_persistance_exceptions.dart';
import 'package:elemination_round_app/features/show_my_rounds/data/models/round_model.dart';
import 'package:hive/hive.dart';

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