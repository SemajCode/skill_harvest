import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillharvest/models/course.dart';
import 'package:skillharvest/data/dummy_data.dart';

class CourseNotifier extends StateNotifier<List<Course>> {
  CourseNotifier(super.state);
}

final CourseNotifier _courseNotifier = CourseNotifier(dummyCourses);

final courseProvider =
    StateNotifierProvider<CourseNotifier, List<Course>>((ref) {
  return _courseNotifier;
});
