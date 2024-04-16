import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
// import 'package:skillharvest/data/database.dart';
import 'package:skillharvest/models/course.dart';

final userCourseBox = Hive.box('userCourseBox');
List<dynamic> userCourse = loadUserCourse();
List<dynamic> loadUserCourse() {
  if (userCourseBox.containsKey('COURSELIST')) {
    return userCourseBox.get('COURSELIST');
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
      // final userCourseBox = await Hive.openBox('userCourseBox');
      userCourseBox.put('COURSELIST', state);
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
    // final userCourseBox = await Hive.openBox('userCourseBox');
    userCourseBox.put('COURSELIST', state);
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
    // final userCourseBox = await Hive.openBox('userCourseBox');
    userCourseBox.put('COURSELIST', state);
    List courses = userCourseBox.get('COURSELIST');
    print(courses.length);
  }
}

final UserCourseNotifier _userCourseNotifier = UserCourseNotifier(userCourse);

final userCourseProvider =
    StateNotifierProvider<UserCourseNotifier, List<dynamic>>(
        (ref) => _userCourseNotifier);
