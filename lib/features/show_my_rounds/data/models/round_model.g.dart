// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoundModelAdapter extends TypeAdapter<RoundModel> {
  @override
  final int typeId = 0;

  @override
  RoundModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoundModel(
      level: fields[0] as int?,
      date: fields[1] as DateTime?,
      userID: fields[2] as String?,
      setResults: (fields[3] as Map?)?.map((dynamic k, dynamic v) =>
          MapEntry(k as String, (v as List).cast<int>())),
      totalResult: (fields[4] as Map?)?.cast<String, int>(),
      shootOff: (fields[5] as Map?)?.cast<String, int>(),
      myShots: (fields[6] as List?)?.cast<int>(),
      comment: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RoundModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.userID)
      ..writeByte(3)
      ..write(obj.setResults)
      ..writeByte(4)
      ..write(obj.totalResult)
      ..writeByte(5)
      ..write(obj.shootOff)
      ..writeByte(6)
      ..write(obj.myShots)
      ..writeByte(7)
      ..write(obj.comment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoundModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
