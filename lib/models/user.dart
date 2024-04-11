import 'package:skillharvest/features/course/screens/course.dart';

class User {
  User({
    required this.displayName,
    required this.imagePath,
    required this.userCourses,
  });
  final String displayName;
  final String imagePath;
  final List<Course> userCourses;
}
