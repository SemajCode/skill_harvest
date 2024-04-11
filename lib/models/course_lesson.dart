// ignore_for_file: public_member_api_docs, sort_constructors_first
class CourseLesson {
  CourseLesson({
    required this.title,
    required this.lessonNumber,
    required this.duration,
    required this.isCompleted,
  });

  final String title;
  final int lessonNumber;
  final String duration;
  final bool isCompleted;
}
