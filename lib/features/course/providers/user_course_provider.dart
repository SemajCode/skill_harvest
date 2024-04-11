import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillharvest/models/course.dart';

class UserCourseNotifier extends StateNotifier<List<Course>> {
  UserCourseNotifier(super.state);
  void addCourse(Course course) {
    state = [course, ...state];
  }
}

final UserCourseNotifier _userCourseNotifier = UserCourseNotifier([]);

final userCourseProvider =
    StateNotifierProvider<UserCourseNotifier, List<Course>>(
        (ref) => _userCourseNotifier);
