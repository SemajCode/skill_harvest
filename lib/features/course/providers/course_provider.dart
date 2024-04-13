import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillharvest/models/course.dart';
import 'package:skillharvest/data/dummy_data.dart';

import '../../../models/course_lesson.dart';

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

  void buy(courseIndex) {
    List<CourseLesson> newLessonList = [];
    for (var element in state[courseIndex].lessons) {
      newLessonList = [...newLessonList, element.copyWith(isLocked: false)];
    }
    state[courseIndex] = state[courseIndex].copyWith(
      lessons: newLessonList,
      isPaid: true,
    );
  }
}

final CourseNotifier _courseNotifier = CourseNotifier(dummyCourses);

final courseProvider = StateNotifierProvider<CourseNotifier, List<Course>>(
    (ref) => _courseNotifier);
