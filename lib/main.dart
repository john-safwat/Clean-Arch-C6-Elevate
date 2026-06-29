import 'package:c6_elevate_clean_arch/core/di/di.dart';
import 'package:c6_elevate_clean_arch/presentation/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeView());
  }
}
