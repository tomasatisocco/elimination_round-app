import 'package:bloc/bloc.dart';
import 'package:elemination_round_app/features/show_my_rounds/data/models/round_model.dart';
import 'package:elemination_round_app/features/show_my_rounds/data/repositories/show_my_rounds_repositorie_implementation.dart';
import 'package:elemination_round_app/features/show_my_rounds/domain/usecases/get_my_rounds.dart';
import 'package:equatable/equatable.dart';

part 'show_my_rounds_state.dart';

class ShowMyRoundsCubit extends Cubit<ShowMyRoundsState> {
  ShowMyRoundsCubit() : super(const ShowMyRoundsInitial());

  Future<void> loadMyRounds() async {
    emit(const ShowMyRoundsLoading());
    final failureOyMyRounds =
        await GetMyRounds(ShowMyRoundsRepsitoryImpl()).call();
    failureOyMyRounds.fold(
      (failure) => emit(ShowMyRoundsError(errorMessage: failure.errorMessege!)),
      (myRounds) =>
          emit(ShowMyRoundsLoaded(roundModels: myRounds as List<RoundModel>?)),
    );
  }

  void shareRoundPressed() {}
  void seeDetailsPressed() {}
  void editRoundPressed() {}
}
