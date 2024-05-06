// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DriverRequestAdapter extends TypeAdapter<DriverRequest> {
  @override
  final int typeId = 3;

  @override
  DriverRequest read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DriverRequest(
      id: fields[0] as int?,
      username: fields[12] as String?,
      userphn: fields[11] as String?,
      name: fields[1] as String?,
      phone: fields[2] as String?,
      image: fields[3] as String?,
      pickuplocation: fields[4] as String?,
      gear: fields[5] as String?,
      model: fields[6] as String?,
      pickuptime: fields[7] as String?,
      estimatetime: fields[8] as String?,
      accept: fields[9] as bool?,
      reject: fields[10] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, DriverRequest obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.pickuplocation)
      ..writeByte(5)
      ..write(obj.gear)
      ..writeByte(6)
      ..write(obj.model)
      ..writeByte(7)
      ..write(obj.pickuptime)
      ..writeByte(8)
      ..write(obj.estimatetime)
      ..writeByte(9)
      ..write(obj.accept)
      ..writeByte(10)
      ..write(obj.reject)
      ..writeByte(11)
      ..write(obj.userphn)
      ..writeByte(12)
      ..write(obj.username);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriverRequestAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
