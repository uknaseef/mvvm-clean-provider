import 'package:flutter/material.dart';
import 'res/constants/app_constants.dart';
import 'res/styles/app_theme.dart';
import 'services/dipendancy_injection/get_it.dart';
import 'utils/routes/route_generator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.themeData,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
