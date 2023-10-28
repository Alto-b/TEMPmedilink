// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeptInsAdapter extends TypeAdapter<DeptIns> {
  @override
  final int typeId = 0;

  @override
  DeptIns read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeptIns()..dept = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, DeptIns obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.dept);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeptInsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
