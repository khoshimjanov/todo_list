// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 1;

  @override
  Category read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Category.nocategory;
      case 1:
        return Category.wishlist;
      case 2:
        return Category.work;
      case 3:
        return Category.birthday;
      case 4:
        return Category.personal;
      case 5:
        return Category.daily;
      default:
        return Category.nocategory;
    }
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    switch (obj) {
      case Category.nocategory:
        writer.writeByte(0);
        break;
      case Category.wishlist:
        writer.writeByte(1);
        break;
      case Category.work:
        writer.writeByte(2);
        break;
      case Category.birthday:
        writer.writeByte(3);
        break;
      case Category.personal:
        writer.writeByte(4);
        break;
      case Category.daily:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
