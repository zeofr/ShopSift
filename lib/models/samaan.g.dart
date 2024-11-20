// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'samaan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SamaanAdapter extends TypeAdapter<Samaan> {
  @override
  final int typeId = 0;

  @override
  Samaan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Samaan(
      naam: fields[0] as String,
      samaanId: fields[1] as String,
      daam: fields[2] as double,
      soochna: fields[3] as String,
      imagePath: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Samaan obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.naam)
      ..writeByte(1)
      ..write(obj.samaanId)
      ..writeByte(2)
      ..write(obj.daam)
      ..writeByte(3)
      ..write(obj.soochna)
      ..writeByte(4)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SamaanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
