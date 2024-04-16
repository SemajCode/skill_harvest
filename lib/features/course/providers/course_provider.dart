import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:skillharvest/core/util/constants/constant.dart';
import 'package:skillharvest/models/course.dart';
import 'package:skillharvest/data/dummy_course_data.dart';

final courseBox = Hive.box(HiveConst.courseBox);
List<dynamic> courseList = loadCourses();
List<dynamic> loadCourses() {
  if (courseBox.containsKey(HiveConst.courseKey) == false) {
    courseBox.put(HiveConst.courseKey, dummyCourses);
  }
  return courseBox.get(HiveConst.courseKey);
}

class CourseNotifier extends StateNotifier<List<dynamic>> {
  CourseNotifier(super.state);
  void toggleFavorite(course) {
    var i = 0;
    for (var element in state) {
      if (element.title == course.title) {
        state[i] = state[i].copyWith(isFavorite: !state[i].isFavorite);
      } else {}
      i += 1;
    }
    courseBox.put(HiveConst.courseKey, state);
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
    courseBox.put(HiveConst.courseKey, state);
  }

  void buy(courseIndex) {
    List<CourseLesson> newLessonList = [];
    for (var element in state[courseIndex].lessons) {
      newLessonList = [...newLessonList, element.copyWith(isLocked: false)];
    }
    state[courseIndex] = state[courseIndex].copyWith(
      lessons: newLessonList,
      isPaid: true,
    );
    courseBox.put(HiveConst.courseKey, state);
  }

  void removeCourse(Course course) {
    final isFav = course.isFavorite;
    var courseIndex = 0;
    var dummyCourseIndex = 0;
    for (var element in state) {
      if (element.title == course.title) {
        courseIndex = state.indexOf(element);
      }
    }
    for (var element in dummyCourses) {
      if (element.title == course.title) {
        dummyCourseIndex = dummyCourses.indexOf(element);
      }
    }
    state[courseIndex] =
        dummyCourses[dummyCourseIndex].copyWith(isFavorite: isFav);
    courseBox.put(HiveConst.courseKey, state);
  }
}

final CourseNotifier _courseNotifier = CourseNotifier(courseList);

final courseProvider = StateNotifierProvider<CourseNotifier, List<dynamic>>(
    (ref) => _courseNotifier);
