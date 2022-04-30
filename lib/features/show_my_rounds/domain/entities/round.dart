import 'dart:core';

import 'package:equatable/equatable.dart';

abstract class Round extends Equatable{
  const Round({
    required this.level,
    required this.date,
    required this.userID,
    this.setResults,
    this.totalResult,
    this.shootOff,
    this.myShots,
    this.comment,
  });

  final int? level;
  final DateTime? date;
  final String? userID;
  final Map<String,List<int>>? setResults;
  final Map<String,int>? totalResult;
  final Map<String,int>? shootOff;
  final List<int>? myShots;
  final String? comment;
}