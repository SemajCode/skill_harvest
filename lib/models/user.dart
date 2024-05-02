import 'package:skillharvest/features/course/screens/course.dart';

class UserModel {
  UserModel({
    required this.displayName,
    required this.imagePath,
    required this.userCourses,
    required this.phoneNumber,
  });
  final String displayName;
  final String phoneNumber;
  final String imagePath;
  final List<CourseScreen> userCourses;
}
