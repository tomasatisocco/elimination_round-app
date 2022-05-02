// ignore_for_file: annotate_overrides, overridden_fields, must_be_immutable

import 'package:hive/hive.dart';

import '../../domain/entities/round.dart';

part 'round_model.g.dart';

@HiveType(typeId: 0)
class RoundModel extends Round with HiveObjectMixin {
  RoundModel({
    @HiveField(0) int? level,
    @HiveField(1) DateTime? date,
    @HiveField(2) String? userID,
    @HiveField(3) Map<String, List<int>>? setResults,
    @HiveField(4) Map<String, int>? totalResult,
    @HiveField(5) Map<String, int>? shootOff,
    @HiveField(6) List<int>? myShots,
    @HiveField(7) String? comment,
    @HiveField(8) bool? isFinished,
  }) : super(
          level: level,
          date: date,
          userID: userID,
          setResults: setResults,
          myShots: myShots,
          totalResult: totalResult,
          shootOff: shootOff,
          comment: comment,
          isFinished: isFinished,
        );

  factory RoundModel.formJson(Map<String, dynamic> json) {
    return RoundModel(
      level: json["level"],
      date: json["date"],
      userID: json["userID"],
      setResults: json["setResults"],
      myShots: json["myShots"],
      totalResult: json["totalResult"],
      shootOff: json["shootOff"],
      comment: json["comment"],
      isFinished: json["isFinished"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "level": level,
      "date": date,
      "userID": userID,
      "setResults": setResults,
      "myShots": myShots,
      "totalResult": totalResult,
      "shootOff": shootOff,
      "comment": comment,
      "isFinished": isFinished,
    };
  }

  RoundModel copyWith(RoundModel newModel) {
    return RoundModel(
      level: newModel.level ?? level,
      date: newModel.date ?? date,
      userID: newModel.userID ?? userID,
      setResults: newModel.setResults ?? setResults,
      myShots: newModel.myShots ?? myShots,
      totalResult: newModel.totalResult ?? totalResult,
      shootOff: newModel.shootOff ?? shootOff,
      comment: newModel.comment ?? comment,
      isFinished: newModel.isFinished,
    );
  }

  @override
  String toString() {
    return '''
      RoundModel:
      level: $level
      date: $date
      userID: $userID
      setResults: $setResults
      myShots: $myShots
      totalResult: $totalResult
      shootOff: $shootOff
      comment: $comment
      isFinished: $isFinished
    ''';
  }

  @override
  List<Object?> get props => [
        level,
        date,
        userID,
        setResults,
        myShots,
        totalResult,
        shootOff,
        comment,
        isFinished,
      ];
}
