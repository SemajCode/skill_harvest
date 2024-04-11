// ignore_for_file: unused_local_variable

import 'package:skillharvest/core/util/constants/enums.dart';
import 'package:skillharvest/models/course.dart';
import 'package:skillharvest/models/course_lesson.dart';

void main() {
  List<Course> dummyCourses = [
    Course(
      title: 'Introduction to Programming',
      price: '0',
      instructor: 'John Doe',
      duration: '2 hours 15 min',
      description:
          'Learn the basics of programming with this introductory course.',
      lessons: [
        CourseLesson(
          title: 'Variables and Data Types',
          lessonNumber: 1,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Conditional Statements',
          lessonNumber: 2,
          duration: '45 min',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Loops',
          lessonNumber: 3,
          duration: '30 min',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.coding,
      isPaid: false,
      noOfLessons: 3,
      completedLessons: 0,
    ),
    Course(
      title: 'UI/UX Design Fundamentals',
      price: '0',
      instructor: 'Jane Smith',
      duration: '3 hours 15 min',
      description:
          'Learn the basics of UI/UX design and create stunning user interfaces.',
      lessons: [
        CourseLesson(
          title: 'Introduction to UI Design',
          lessonNumber: 1,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Color Theory',
          lessonNumber: 2,
          duration: '1 hour 15 min',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Wireframing',
          lessonNumber: 3,
          duration: '1 hour',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.design,
      isPaid: false,
      noOfLessons: 3,
      completedLessons: 0,
    ),
    Course(
      title: 'Digital Marketing Essentials',
      price: '0',
      instructor: 'Alice Johnson',
      duration: '4 hours 30 min',
      description:
          'Master the fundamentals of digital marketing and boost your online presence.',
      lessons: [
        CourseLesson(
          title: 'Introduction to Digital Marketing',
          lessonNumber: 1,
          duration: '1 hour 30 min',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'SEO Basics',
          lessonNumber: 2,
          duration: '1 hour 30 min',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Social Media Marketing',
          lessonNumber: 3,
          duration: '1 hour 30 min',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.marketing,
      isPaid: false,
      noOfLessons: 3,
      completedLessons: 0,
    ),
    Course(
      title: 'Financial Planning and Analysis',
      price: '0',
      instructor: 'Bob Williams',
      duration: '4 hours 30 min',
      description:
          'Learn how to analyze financial data and make informed business decisions.',
      lessons: [
        CourseLesson(
          title: 'Introduction to Finance',
          lessonNumber: 1,
          duration: '1 hour 30 min',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Financial Statement Analysis',
          lessonNumber: 2,
          duration: '1 hour 30 min',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Budgeting and Forecasting',
          lessonNumber: 3,
          duration: '1 hour 30 min',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.finance,
      isPaid: false,
      noOfLessons: 3,
      completedLessons: 0,
    ),
    Course(
      title: 'Course Title',
      price: '0',
      instructor: 'Instructor Name',
      duration: 'Total Duration',
      description: 'Course Description',
      lessons: [
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 1,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 2,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 3,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.coding,
      isPaid: false,
      noOfLessons: 3,
      completedLessons: 0,
    ),
    Course(
      title: 'Course Title',
      price: '0',
      instructor: 'Instructor Name',
      duration: 'Total Duration',
      description: 'Course Description',
      lessons: [
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 1,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 2,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 3,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.coding,
      isPaid: false,
      noOfLessons: 3,
      completedLessons: 0,
    ),
    Course(
      title: 'Course Title',
      price: '0',
      instructor: 'Instructor Name',
      duration: 'Total Duration',
      description: 'Course Description',
      lessons: [
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 1,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 2,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 3,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.coding,
      isPaid: false,
      noOfLessons: 3,
      completedLessons: 0,
    ),
    Course(
      title: 'Course Title',
      price: '0',
      instructor: 'Instructor Name',
      duration: 'Total Duration',
      description: 'Course Description',
      lessons: [
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 1,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 2,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 3,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.coding,
      isPaid: false,
      noOfLessons: 3,
      completedLessons: 0,
    ),
    Course(
      title: 'Course Title',
      price: '0',
      instructor: 'Instructor Name',
      duration: 'Total Duration',
      description: 'Course Description',
      lessons: [
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 1,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 2,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 3,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.coding,
      isPaid: false,
      noOfLessons: 3,
      completedLessons: 0,
    ),
    Course(
      title: 'Course Title',
      price: '0',
      instructor: 'Instructor Name',
      duration: 'Total Duration',
      description: 'Course Description',
      lessons: [
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 1,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 2,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Lesson Title',
          lessonNumber: 3,
          duration: 'Lesson Duration',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.coding,
      isPaid: false,
      noOfLessons: 3,
      completedLessons: 0,
    ),
  ];
}
