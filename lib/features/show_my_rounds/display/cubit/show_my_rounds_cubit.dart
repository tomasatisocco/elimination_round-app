import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/round_model.dart';
import '../../data/repositories/show_my_rounds_repository_implementation.dart';
import '../../domain/usecases/get_my_rounds.dart';

part 'show_my_rounds_state.dart';

class ShowMyRoundsCubit extends Cubit<ShowMyRoundsState> {
  ShowMyRoundsCubit() : super(const ShowMyRoundsInitial());

  Future<void> loadMyRounds() async {
    emit(const ShowMyRoundsLoading());
    final failureOyMyRounds =
        await GetMyRounds(ShowMyRoundsRepositoryImpl()).call();
    failureOyMyRounds.fold(
      (failure) => emit(ShowMyRoundsError(errorMessage: failure.errorMessage!)),
      (myRounds) =>
          emit(ShowMyRoundsLoaded(roundModels: myRounds as List<RoundModel>?)),
    );
  }

  void shareRoundPressed() {}
  void seeDetailsPressed() {}
  void editRoundPressed() {}
}
