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
    required this.noOfLessons,
    required this.completedLessons,
  });
  final String title;
  final String price;
  final String instructor;
  final int duration;
  final String description;
  final List<CourseLesson> lessons;
  final CourseCategory category;
  final bool isPaid;
  final int noOfLessons;
  final int completedLessons;
}
