import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const GraduationPlannerApp());
}

class GraduationPlannerApp extends StatelessWidget {
  const GraduationPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Graduation Planner',
      theme: AppTheme.theme,
      home: const HomeScreen(),
    );
  }
}