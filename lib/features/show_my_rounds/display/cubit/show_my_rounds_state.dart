part of 'show_my_rounds_cubit.dart';

abstract class ShowMyRoundsState extends Equatable {
  const ShowMyRoundsState({this.roundModels});

  final List<RoundModel>? roundModels;

  @override
  List<Object> get props => [];
}

class ShowMyRoundsInitial extends ShowMyRoundsState {
  const ShowMyRoundsInitial({List<RoundModel>? roundModels})
      : super(roundModels: roundModels);
}

class ShowMyRoundsLoading extends ShowMyRoundsState {
  const ShowMyRoundsLoading({List<RoundModel>? roundModels})
      : super(roundModels: roundModels);
}

class ShowMyRoundsLoaded extends ShowMyRoundsState {
  const ShowMyRoundsLoaded({List<RoundModel>? roundModels})
      : super(roundModels: roundModels);
}

class ShowMyRoundsError extends ShowMyRoundsState {
  const ShowMyRoundsError(
      {required this.errorMessage, List<RoundModel>? roundModels})
      : super(roundModels: roundModels);
  final String errorMessage;
}
