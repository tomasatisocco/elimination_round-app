import 'package:hive/hive.dart';
import 'package:elemination_round_app/features/show_my_rounds/domain/entities/round.dart';

part 'round_model.g.dart';

@HiveType(typeId: 0)
class RoundModel extends Round {
  const RoundModel({
    this.level,
    this.date,
    this.userID,
    this.setResults,
    this.totalResult,
    this.shootOff,
    this.myShots,
    this.comment,
  }) : super(
          level: level,
          date: date,
          userID: userID,
          setResults: setResults,
          myShots: myShots,
          totalResult: totalResult,
          shootOff: shootOff,
          comment: comment,
        );

  @HiveField(0)
  final int? level;
  @HiveField(1)
  final DateTime? date;
  @HiveField(2)
  final String? userID;
  @HiveField(3)
  final Map<String, List<int>>? setResults;
  @HiveField(4)
  final Map<String, int>? totalResult;
  @HiveField(5)
  final Map<String, int>? shootOff;
  @HiveField(6)
  final List<int>? myShots;
  @HiveField(7)
  final String? comment;

  factory RoundModel.formJson(Map<String,dynamic> json){
    return RoundModel(
      level: json["level"],
      date: json["date"],
      userID: json["userID"],
      setResults: json["setResults"],
      myShots: json["myShots"],
      totalResult: json["totalResult"],
      shootOff: json["shootOff"],
      comment: json["comment"],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "level": level,
      "date": date,
      "userID": userID,
      "setResults": setResults,
      "myShots": myShots,
      "totalResult": totalResult,
      "shootOff": shootOff,
      "comment": comment,
    };
  }

  RoundModel copyWith(RoundModel newModel){
    return RoundModel(
      level: newModel.level ?? level,
      date: newModel.date ?? date,
      userID: newModel.userID ?? userID,
      setResults: newModel.setResults ?? setResults,
      myShots: newModel.myShots ?? myShots,
      totalResult: newModel.totalResult ?? totalResult,
      shootOff: newModel.shootOff ?? shootOff,
      comment: newModel.comment ?? comment,
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
  ];
}
