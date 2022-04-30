import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/round.dart';

abstract class ShowMyRoundsRepository {
  Future<Either<Failure,List<Round>?>> getMyRounds();
}