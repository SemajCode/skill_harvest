import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillharvest/models/course.dart';
import 'package:skillharvest/data/dummy_data.dart';

class CourseNotifier extends StateNotifier<List<Course>> {
  CourseNotifier(super.state);

  void star(courseIndex) {
    state[courseIndex] =
        state[courseIndex].copyWith(isFavorite: !state[courseIndex].isFavorite);
  }
}

final CourseNotifier _courseNotifier = CourseNotifier(dummyCourses);

final courseProvider =
    StateNotifierProvider<CourseNotifier, List<Course>>((ref) {
  return _courseNotifier;
});
