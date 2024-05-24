// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_meal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalMealAdapter extends TypeAdapter<LocalMeal> {
  @override
  final int typeId = 0;

  @override
  LocalMeal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalMeal()
      ..idMeal = fields[0] as String?
      ..strMeal = fields[1] as String?
      ..strCategory = fields[2] as String?
      ..strMealThumb = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, LocalMeal obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.idMeal)
      ..writeByte(1)
      ..write(obj.strMeal)
      ..writeByte(2)
      ..write(obj.strCategory)
      ..writeByte(3)
      ..write(obj.strMealThumb);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalMealAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
