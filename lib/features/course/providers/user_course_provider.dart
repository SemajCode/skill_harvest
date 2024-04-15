import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
// import 'package:skillharvest/data/database.dart';
import 'package:skillharvest/models/course.dart';

// final userCourseDb = UserCourseDataBase();

List<dynamic> userCourse = [];
Future loadUserCourse() async {
  final userCourseBox = await Hive.openBox('userCourseBox');

  if (userCourseBox.containsKey('COURSELIST')) {
    userCourse = userCourseBox.get('COURSELIST');
  }
}

class UserCourseNotifier extends StateNotifier<List<dynamic>> {
  UserCourseNotifier(super.state) {
    loadUserCourse();
  }

  Future toggleFavorite(course) async {
    if (state.isNotEmpty) {
      var i = 0;
      for (var element in state) {
        if (element.title == course.title) {
          state[i] = state[i].copyWith(isFavorite: !state[i].isFavorite);
        } else {}
        i += 1;
      }
      final userCourseBox = await Hive.openBox('userCourseBox');
      userCourseBox.put('COURSELIST', state);
    }
  }

  Future toggleLessonCompletion(Course course, int lessonIndex) async {
    var i = 0;
    for (var element in state) {
      if (element.title == course.title) {
        state[i].lessons[lessonIndex] = state[i]
            .lessons[lessonIndex]
            .copyWith(isCompleted: !state[i].lessons[lessonIndex].isCompleted);
      }
      i += 1;
    }
    final userCourseBox = await Hive.openBox('userCourseBox');
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

  Future addCourse(Course course) async {
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
    final userCourseBox = await Hive.openBox('userCourseBox');
    userCourseBox.put('COURSELIST', state);
  }
}

final UserCourseNotifier _userCourseNotifier = UserCourseNotifier(userCourse);

final userCourseProvider =
    StateNotifierProvider<UserCourseNotifier, List<dynamic>>(
        (ref) => _userCourseNotifier);
