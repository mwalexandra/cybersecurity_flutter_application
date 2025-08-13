import 'package:cybersecurity_flutter_application/screens/descr_screen.dart';
import 'package:cybersecurity_flutter_application/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(CybersecurityApp());
}

class CybersecurityApp extends StatelessWidget {
  
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cybersecurity Training App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: AppColors.darkblue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.darkblue,
          brightness: Brightness.dark,
        )
      ),
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Mobile layout
            return MobWelcomeScreen();
          } if (constraints.maxWidth < 1200) {
            // Tablet layout
            return TabletWelcomeScreen();
          } else {
            // Desktop layout
            return WebWelcomeScreen();
          }
        },
      ),
    );
  }
}

