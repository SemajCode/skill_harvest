import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillharvest/models/course.dart';
import 'package:skillharvest/data/dummy_data.dart';

import '../../../models/course_lesson.dart';

class CourseNotifier extends StateNotifier<List<Course>> {
  CourseNotifier(super.state);

  void star(courseIndex) {
    state[courseIndex] =
        state[courseIndex].copyWith(isFavorite: !state[courseIndex].isFavorite);
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
