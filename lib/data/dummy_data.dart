import 'package:skillharvest/core/util/constants/enums.dart';
import 'package:skillharvest/models/course.dart';
import 'package:skillharvest/models/course_lesson.dart';

void main() {
// ignore: unused_local_variable
  List<Course> dummyCourses = [
    Course(
      title: 'Introduction to Programming',
      price: '0',
      instructor: 'John Doe',
      duration: 45,
      description:
          'Learn the basics of programming with this introductory course.',
      lessons: [
        CourseLesson(
          title: 'Variables and Data Types',
          lessonNumber: 1,
          duration: '30 min',
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
          duration: '1 hour',
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
      price: '29.99',
      instructor: 'Jane Smith',
      duration: 60,
      description:
          'Learn the basics of UI/UX design and create stunning user interfaces.',
      lessons: [
        CourseLesson(
          title: 'Introduction to UI Design',
          lessonNumber: 1,
          duration: '45 min',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Color Theory',
          lessonNumber: 2,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Wireframing',
          lessonNumber: 3,
          duration: '1.5 hours',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.design,
      isPaid: true,
      noOfLessons: 3,
      completedLessons: 0,
    ),
    Course(
      title: 'Digital Marketing Essentials',
      price: '49.99',
      instructor: 'Alice Johnson',
      duration: 90,
      description:
          'Master the fundamentals of digital marketing and boost your online presence.',
      lessons: [
        CourseLesson(
          title: 'Introduction to Digital Marketing',
          lessonNumber: 1,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'SEO Basics',
          lessonNumber: 2,
          duration: '1.5 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Social Media Marketing',
          lessonNumber: 3,
          duration: '2 hours',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.marketing,
      isPaid: true,
      noOfLessons: 5,
      completedLessons: 0,
    ),
    Course(
      title: 'Financial Planning and Analysis',
      price: '99.99',
      instructor: 'Bob Williams',
      duration: 60,
      description:
          'Learn how to analyze financial data and make informed business decisions.',
      lessons: [
        CourseLesson(
          title: 'Introduction to Finance',
          lessonNumber: 1,
          duration: '45 min',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Financial Statement Analysis',
          lessonNumber: 2,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Budgeting and Forecasting',
          lessonNumber: 3,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Risk Management',
          lessonNumber: 4,
          duration: '1.5 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Investment Strategies',
          lessonNumber: 5,
          duration: '2 hours',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.finance,
      isPaid: true,
      noOfLessons: 5,
      completedLessons: 0,
    ),
    Course(
      title: 'Python for Data Science',
      price: '79.99',
      instructor: 'Emily Brown',
      duration: 75,
      description:
          'Learn Python programming and its applications in data science.',
      lessons: [
        CourseLesson(
          title: 'Python Basics',
          lessonNumber: 1,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Data Analysis with Pandas',
          lessonNumber: 2,
          duration: '1.5 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Data Visualization with Matplotlib',
          lessonNumber: 3,
          duration: '2 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Machine Learning with Scikit-learn',
          lessonNumber: 4,
          duration: '2 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Deep Learning with TensorFlow',
          lessonNumber: 5,
          duration: '2.5 hours',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.coding,
      isPaid: true,
      noOfLessons: 5,
      completedLessons: 0,
    ),
    // Add more courses with varying noOfLessons
    Course(
      title: 'Responsive Web Design',
      price: '49.99',
      instructor: 'Jessica Adams',
      duration: 60,
      description:
          'Master the art of responsive web design and create websites that work seamlessly across all devices.',
      lessons: [
        CourseLesson(
          title: 'Introduction to Responsive Design',
          lessonNumber: 1,
          duration: '45 min',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Media Queries',
          lessonNumber: 2,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Flexbox and Grid Layouts',
          lessonNumber: 3,
          duration: '1.5 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Responsive Images',
          lessonNumber: 4,
          duration: '1.5 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Responsive Typography',
          lessonNumber: 5,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Responsive Navigation',
          lessonNumber: 6,
          duration: '1 hour',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.design,
      isPaid: true,
      noOfLessons: 6,
      completedLessons: 0,
    ),
    Course(
      title: 'Graphic Design Basics',
      price: '39.99',
      instructor: 'David Wilson',
      duration: 45,
      description:
          'Explore the principles of graphic design and create visually appealing designs.',
      lessons: [
        CourseLesson(
          title: 'Introduction to Graphic Design',
          lessonNumber: 1,
          duration: '30 min',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Typography',
          lessonNumber: 2,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Logo Design',
          lessonNumber: 3,
          duration: '1.5 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Illustration Techniques',
          lessonNumber: 4,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Color Theory in Design',
          lessonNumber: 5,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Typography in Practice',
          lessonNumber: 6,
          duration: '1.5 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Designing for Print vs Web',
          lessonNumber: 7,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Logo Design Workshop',
          lessonNumber: 8,
          duration: '2 hours',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.design,
      isPaid: true,
      noOfLessons: 8,
      completedLessons: 0,
    ),
    Course(
      title: 'Social Media Strategy',
      price: '59.99',
      instructor: 'Sophia Johnson',
      duration: 60,
      description:
          'Develop an effective social media strategy to grow your online presence.',
      lessons: [
        CourseLesson(
          title: 'Understanding Social Media Platforms',
          lessonNumber: 1,
          duration: '45 min',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Content Creation',
          lessonNumber: 2,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Engagement and Analytics',
          lessonNumber: 3,
          duration: '1.5 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Advertising on Social Media',
          lessonNumber: 4,
          duration: '1.5 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Community Building',
          lessonNumber: 5,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Social Media Metrics',
          lessonNumber: 6,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Campaign Planning',
          lessonNumber: 7,
          duration: '1.5 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Influencer Marketing',
          lessonNumber: 8,
          duration: '1.5 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Social Media Analytics Tools',
          lessonNumber: 9,
          duration: '1 hour',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.marketing,
      isPaid: true,
      noOfLessons: 9,
      completedLessons: 0,
    ),
    Course(
      title: 'Personal Finance Management',
      price: '69.99',
      instructor: 'Michael Johnson',
      duration: 90,
      description:
          'Learn how to manage your personal finances effectively and plan for the future.',
      lessons: [
        CourseLesson(
          title: 'Budgeting Basics',
          lessonNumber: 1,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Investment Strategies',
          lessonNumber: 2,
          duration: '1.5 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Retirement Planning',
          lessonNumber: 3,
          duration: '2 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Debt Management',
          lessonNumber: 4,
          duration: '1.5 hours',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.finance,
      isPaid: true,
      noOfLessons: 4,
      completedLessons: 0,
    ),
    Course(
      title: 'Stock Market Investing',
      price: '89.99',
      instructor: 'William Smith',
      duration: 75,
      description:
          'Learn the fundamentals of stock market investing and build a profitable investment portfolio.',
      lessons: [
        CourseLesson(
          title: 'Introduction to Stock Market',
          lessonNumber: 1,
          duration: '1 hour',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Stock Analysis Techniques',
          lessonNumber: 2,
          duration: '1.5 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Risk Management',
          lessonNumber: 3,
          duration: '2 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Portfolio Diversification',
          lessonNumber: 4,
          duration: '1.5 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Value Investing Strategies',
          lessonNumber: 5,
          duration: '2 hours',
          isCompleted: false,
        ),
        CourseLesson(
          title: 'Technical Analysis',
          lessonNumber: 6,
          duration: '1 hour',
          isCompleted: false,
        ),
      ],
      category: CourseCategory.finance,
      isPaid: true,
      noOfLessons: 6,
      completedLessons: 0,
    ),
  ];
}
