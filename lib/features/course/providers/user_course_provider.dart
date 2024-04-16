import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:skillharvest/core/util/constants/constant.dart';
import 'package:skillharvest/models/course.dart';

final userCourseBox = Hive.box(HiveConst.courseBox);
List<dynamic> userCourse = loadUserCourse();
List<dynamic> loadUserCourse() {
  if (userCourseBox.containsKey(HiveConst.userCourseKey)) {
    return userCourseBox.get(HiveConst.userCourseKey);
  } else {
    return [];
  }
}

class UserCourseNotifier extends StateNotifier<List<dynamic>> {
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
      userCourseBox.put(HiveConst.userCourseKey, state);
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
    userCourseBox.put(HiveConst.userCourseKey, state);
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
    userCourseBox.put(HiveConst.userCourseKey, state);
  }

  void removeCourse(Course course) {
    List newState = [];
    for (var element in state) {
      if (element.title != course.title) {
        newState = [element, ...newState];
      }
    }
    state = newState;
    userCourseBox.put(HiveConst.userCourseKey, state);
  }

  bool isAvailable(Course course, int courseIndex) {
    int elementIndex = 0;
    bool isAvailable = false;
    for (var element in state) {
      if (element.title == course.title) {
        elementIndex = state.indexOf(element);
      }
    }
    if (elementIndex == courseIndex) {
      isAvailable = true;
    }
    return isAvailable;
  }
}

final UserCourseNotifier _userCourseNotifier = UserCourseNotifier(userCourse);

final userCourseProvider =
    StateNotifierProvider<UserCourseNotifier, List<dynamic>>(
        (ref) => _userCourseNotifier);
