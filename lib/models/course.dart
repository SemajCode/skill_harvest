import 'package:hive/hive.dart';

part 'course.g.dart';

@HiveType(typeId: 0)
class Course {
  Course({
    required this.title,
    required this.price,
    required this.instructor,
    required this.duration,
    required this.description,
    required this.lessons,
    required this.category,
    required this.isPaid,
    required this.isBestSelling,
    required this.noOfLessons,
    required this.completedLessons,
    required this.isFavorite,
  });
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String price;
  @HiveField(2)
  final String instructor;
  @HiveField(3)
  final String duration;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final List<CourseLesson> lessons;
  @HiveField(6)
  final CategoryConst category;
  @HiveField(7)
  final bool isPaid;
  @HiveField(8)
  final bool isBestSelling;
  @HiveField(9)
  final int noOfLessons;
  @HiveField(10)
  final int completedLessons;
  @HiveField(11)
  final bool isFavorite;

  Course copyWith({
    String? title,
    String? price,
    String? instructor,
    String? duration,
    String? description,
    List<CourseLesson>? lessons,
    CategoryConst? category,
    bool? isPaid,
    bool? isBestSelling,
    int? noOfLessons,
    int? completedLessons,
    bool? isFavorite,
  }) {
    return Course(
      title: title ?? this.title,
      price: price ?? this.price,
      instructor: instructor ?? this.instructor,
      duration: duration ?? this.duration,
      description: description ?? this.description,
      lessons: lessons ?? this.lessons,
      category: category ?? this.category,
      isPaid: isPaid ?? this.isPaid,
      isBestSelling: isBestSelling ?? this.isBestSelling,
      noOfLessons: noOfLessons ?? this.noOfLessons,
      completedLessons: completedLessons ?? this.completedLessons,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

@HiveType(typeId: 1)
class CourseLesson {
  CourseLesson({
    required this.title,
    required this.lessonNumber,
    required this.duration,
    required this.isCompleted,
    required this.isLocked,
  });
  @HiveField(0)
  final String title;
  @HiveField(1)
  final int lessonNumber;
  @HiveField(2)
  final String duration;
  @HiveField(3)
  final bool isCompleted;
  @HiveField(4)
  final bool isLocked;

  CourseLesson copyWith({
    String? title,
    int? lessonNumber,
    String? duration,
    bool? isCompleted,
    bool? isLocked,
  }) {
    return CourseLesson(
      title: title ?? this.title,
      lessonNumber: lessonNumber ?? this.lessonNumber,
      duration: duration ?? this.duration,
      isCompleted: isCompleted ?? this.isCompleted,
      isLocked: isLocked ?? this.isLocked,
    );
  }
}

@HiveType(typeId: 2)
enum CategoryConst {
  @HiveField(0)
  coding,
  @HiveField(1)
  design,
  @HiveField(2)
  marketing,
  @HiveField(3)
  finance,
}
