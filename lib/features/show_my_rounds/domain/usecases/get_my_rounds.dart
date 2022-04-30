

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/round.dart';
import '../repositories/show_my_rounds_repository.dart';

class GetMyRounds {
  GetMyRounds(this.repository);

  final ShowMyRoundsRepository repository;

  Future<Either<Failure,List<Round>?>> call() async {
    return await repository.getMyRounds();
  }
}