class CourseLesson {
  CourseLesson({
    required this.title,
    required this.lessonNumber,
    required this.duration,
    required this.isCompleted,
    required this.isLocked,
  });

  final String title;
  final int lessonNumber;
  final String duration;
  final bool isCompleted;
  final bool isLocked;

  CourseLesson copyWith({
    String? title,
    int? lessonNumber,
    String? duration,
    bool? isCompleted,
    bool? isLocked,
  }) {
    return CourseLesson(
      title: title ?? this.title,
      lessonNumber: lessonNumber ?? this.lessonNumber,
      duration: duration ?? this.duration,
      isCompleted: isCompleted ?? this.isCompleted,
      isLocked: isLocked ?? this.isLocked,
    );
  }
}
