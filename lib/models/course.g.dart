// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseAdapter extends TypeAdapter<Course> {
  @override
  final int typeId = 0;

  @override
  Course read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Course(
      title: fields[0] as String,
      price: fields[1] as String,
      instructor: fields[2] as String,
      duration: fields[3] as String,
      description: fields[4] as String,
      lessons: (fields[5] as List).cast<CourseLesson>(),
      category: fields[6] as CategoryConst,
      isPaid: fields[7] as bool,
      isBestSelling: fields[8] as bool,
      noOfLessons: fields[9] as int,
      completedLessons: fields[10] as int,
      isFavorite: fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Course obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.instructor)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.lessons)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.isPaid)
      ..writeByte(8)
      ..write(obj.isBestSelling)
      ..writeByte(9)
      ..write(obj.noOfLessons)
      ..writeByte(10)
      ..write(obj.completedLessons)
      ..writeByte(11)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CourseLessonAdapter extends TypeAdapter<CourseLesson> {
  @override
  final int typeId = 1;

  @override
  CourseLesson read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseLesson(
      title: fields[0] as String,
      lessonNumber: fields[1] as int,
      duration: fields[2] as String,
      isCompleted: fields[3] as bool,
      isLocked: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CourseLesson obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.lessonNumber)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.isCompleted)
      ..writeByte(4)
      ..write(obj.isLocked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseLessonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryConstAdapter extends TypeAdapter<CategoryConst> {
  @override
  final int typeId = 2;

  @override
  CategoryConst read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CategoryConst.coding;
      case 1:
        return CategoryConst.design;
      case 2:
        return CategoryConst.marketing;
      case 3:
        return CategoryConst.finance;
      default:
        return CategoryConst.coding;
    }
  }

  @override
  void write(BinaryWriter writer, CategoryConst obj) {
    switch (obj) {
      case CategoryConst.coding:
        writer.writeByte(0);
        break;
      case CategoryConst.design:
        writer.writeByte(1);
        break;
      case CategoryConst.marketing:
        writer.writeByte(2);
        break;
      case CategoryConst.finance:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryConstAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
