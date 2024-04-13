import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillharvest/models/course.dart';

class UserCourseNotifier extends StateNotifier<List<Course>> {
  UserCourseNotifier(super.state);
  void toggleFavorite(course) {
    if (state.isNotEmpty) {
      var i = 0;
      for (var element in state) {
        if (element.title == course.title) {
          state[i] = state[i].copyWith(isFavorite: !state[i].isFavorite);
        } else {}
        i += 1;
      }
    }
  }

  void toggleLessonCompletion(Course course, int lessonIndex) {
    var i = 0;
    for (var element in state) {
      if (element.title == course.title) {
        state[i].lessons[lessonIndex] = state[i]
            .lessons[lessonIndex]
            .copyWith(isCompleted: !state[i].lessons[lessonIndex].isCompleted);
      }
      i += 1;
    }
  }

  int noOfCompletedLessons(
    int courseIndex,
  ) {
    var lessons = state[courseIndex].lessons;
    int i = 0;
    for (var element in lessons) {
      if (element.isCompleted == true) {
        i += 1;
      }
    }
    return i;
  }

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
