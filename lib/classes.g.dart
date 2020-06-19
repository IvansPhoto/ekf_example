// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeesDataAdapter extends TypeAdapter<EmployeesData> {
  @override
  final typeId = 0;

  @override
  EmployeesData read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeesData(
      id: fields[0] as int,
      name: fields[1] as String,
      surName: fields[2] as String,
      patronymic: fields[3] as String,
      birthdate: fields[4] as DateTime,
      position: fields[5] as String,
      children: (fields[6] as List)?.cast<ChildrenData>(),
    );
  }

  @override
  void write(BinaryWriter writer, EmployeesData obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.surName)
      ..writeByte(3)
      ..write(obj.patronymic)
      ..writeByte(4)
      ..write(obj.birthdate)
      ..writeByte(5)
      ..write(obj.position)
      ..writeByte(6)
      ..write(obj.children);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeesDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChildrenDataAdapter extends TypeAdapter<ChildrenData> {
  @override
  final typeId = 1;

  @override
  ChildrenData read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChildrenData(
      id: fields[0] as int,
      name: fields[1] as String,
      surName: fields[2] as String,
      patronymic: fields[3] as String,
      birthdate: fields[4] as DateTime,
      parent: fields[5] as EmployeesData,
    );
  }

  @override
  void write(BinaryWriter writer, ChildrenData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.surName)
      ..writeByte(3)
      ..write(obj.patronymic)
      ..writeByte(4)
      ..write(obj.birthdate)
      ..writeByte(5)
      ..write(obj.parent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChildrenDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
