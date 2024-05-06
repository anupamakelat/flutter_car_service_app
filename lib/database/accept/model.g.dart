// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AcceptDataAdapter extends TypeAdapter<AcceptData> {
  @override
  final int typeId = 6;

  @override
  AcceptData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AcceptData(
      id: fields[0] as int?,
      yourlocation: fields[1] as String?,
      landmark: fields[2] as String?,
      gear: fields[3] as String?,
      model: fields[4] as String?,
      registration_no: fields[5] as String?,
      contact: fields[6] as String?,
      problem: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AcceptData obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.yourlocation)
      ..writeByte(2)
      ..write(obj.landmark)
      ..writeByte(3)
      ..write(obj.gear)
      ..writeByte(4)
      ..write(obj.model)
      ..writeByte(5)
      ..write(obj.registration_no)
      ..writeByte(6)
      ..write(obj.contact)
      ..writeByte(7)
      ..write(obj.problem);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AcceptDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
