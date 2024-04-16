import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/features/home/screens/home.dart';
import 'package:skillharvest/models/course.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(document.path);
  Hive.registerAdapter(CourseAdapter());
  Hive.registerAdapter(CourseLessonAdapter());
  Hive.registerAdapter(CategoryConstAdapter());
  await Hive.openBox('courseBox');

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkillHarvest',
      theme: Pallete.lightThemeMode,
      darkTheme: Pallete.darkThemeMode,
      themeMode: ThemeMode.light,
      home: const Home(),
    );
  }
}
