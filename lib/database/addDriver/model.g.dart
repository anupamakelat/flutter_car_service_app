// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DriverDataAdapter extends TypeAdapter<DriverData> {
  @override
  final int typeId = 2;

  @override
  DriverData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DriverData(
      id: fields[0] as int?,
      image: fields[1] as String?,
      name: fields[2] as String?,
      contact: fields[3] as int?,
      experience: fields[4] as int?,
      description: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DriverData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.contact)
      ..writeByte(4)
      ..write(obj.experience)
      ..writeByte(5)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriverDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
