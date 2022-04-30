import 'package:elemination_round_app/core/errors/exceptions/local_persistance_exceptions.dart';
import 'package:elemination_round_app/features/show_my_rounds/data/datasources/my_shots_local_datasource.dart';
import 'package:elemination_round_app/features/show_my_rounds/data/models/round_model.dart';
import 'package:elemination_round_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:elemination_round_app/features/show_my_rounds/domain/repositories/show_my_rounds_repository.dart';

class ShowMyRoundsRepsitoryImpl extends ShowMyRoundsRepository {
  ShowMyRoundsRepsitoryImpl({MyShotsLocalDataSource? localDataSource})
      : _localDataSource = localDataSource ?? MyShotsLocalDataSourceImp();
  final MyShotsLocalDataSource _localDataSource;
  @override
  Future<Either<Failure, List<RoundModel>?>> getMyRounds() async {
    try {
      return Right(await _localDataSource.getModelsInLocalDatasource());
    } on ReadLocalPersistanceException {
      return const Left(
        LocalPersistenceFailure(
          errorMessege: 'Error al leer la base de datos local',
        ),
      );
    }
  }
}
