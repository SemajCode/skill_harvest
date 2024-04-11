import 'package:skillharvest/core/util/constants/enums.dart';
import 'package:skillharvest/models/course_lesson.dart';

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
  final String title;
  final String price;
  final String instructor;
  final String duration;
  final String description;
  final List<CourseLesson> lessons;
  final CategoryConst category;
  final bool isPaid;
  final bool isBestSelling;
  final int noOfLessons;
  final int completedLessons;
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
