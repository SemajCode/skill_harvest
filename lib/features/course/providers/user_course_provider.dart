import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillharvest/models/course.dart';

class UserCourseNotifier extends StateNotifier<List<Course>> {
  UserCourseNotifier(super.state);
  void addCourse(Course course) {
    List<bool> list = [];
    for (var element in state) {
      if (element.title == course.title) {
        list.add(true);
      }
    }
    if (list.contains(true)) {
      return;
    } else {
      state = [course, ...state];
    }
  }
}

final UserCourseNotifier _userCourseNotifier = UserCourseNotifier([]);

final userCourseProvider =
    StateNotifierProvider<UserCourseNotifier, List<Course>>(
        (ref) => _userCourseNotifier);
