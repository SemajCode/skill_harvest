import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import 'package:skillharvest/core/util/constants/constant.dart';
import 'package:skillharvest/data/dummy_course_data.dart';
import 'package:skillharvest/models/course.dart';

final courseBox = Hive.box(HiveConst.courseBox);
List<Course> courseList = loadCourses();
List<Course> loadCourses() {
  if (courseBox.containsKey(HiveConst.courseKey) == false) {
    courseBox.put(HiveConst.courseKey, dummyCourses);
  }
  return courseBox.get(HiveConst.courseKey).cast<Course>();
}

class CourseNotifier extends StateNotifier<List<Course>> {
  CourseNotifier(super.state);
  void toggleFavorite(course) {
    var i = 0;
    for (var element in state) {
      if (element.title == course.title) {
        state[i] = state[i].copyWith(isFavorite: !state[i].isFavorite);
      } else {}
      i += 1;
    }
    state = [...state];
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
    state = [...state];
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
    state = [...state];
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
    state = [...state];
    courseBox.put(HiveConst.courseKey, state);
  }
}

final CourseNotifier _courseNotifier = CourseNotifier(courseList);

final courseProvider = StateNotifierProvider<CourseNotifier, List<Course>>(
    (ref) => _courseNotifier);
