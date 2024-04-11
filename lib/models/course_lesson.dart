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
