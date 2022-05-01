import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions/local_persistance_exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repositories/show_my_rounds_repository.dart';
import '../datasources/my_shots_local_datasource.dart';
import '../models/round_model.dart';

class ShowMyRoundsRepositoryImpl extends ShowMyRoundsRepository {
  ShowMyRoundsRepositoryImpl({MyShotsLocalDataSource? localDataSource})
      : _localDataSource = localDataSource ?? MyShotsLocalDataSourceImp();
  final MyShotsLocalDataSource _localDataSource;
  @override
  Future<Either<Failure, List<RoundModel>?>> getMyRounds() async {
    try {
      return Right(await _localDataSource.getModelsInLocalDatasource());
    } on ReadLocalPersistanceException {
      return const Left(
        LocalPersistenceFailure(
          errorMessage: 'Error al leer la base de datos local',
        ),
      );
    }
  }
}
