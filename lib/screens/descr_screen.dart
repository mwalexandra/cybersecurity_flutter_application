import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'package:cybersecurity_flutter_application/screens/topics_screen.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkblue,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;

            // Адаптивные размеры
            final titleFontSize = screenWidth * 0.08; // ~35 при ширине 400
            final bodyFontSize = screenWidth * 0.045; // ~18 при ширине 400
            final buttonFontSize = screenWidth * 0.05;
            final horizontalPadding = screenWidth * 0.1;
            final verticalPadding = screenHeight * 0.02;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'What is it?',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: verticalPadding),
                  Text(
                    'This app will help you feel safer in the digital world. You will get a bit of theory and practical tips to protect your data and devices from cybercriminals.\n\nAt the end, you will be able to answer a few questions based on the material you have read.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: verticalPadding * 2),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightpink,
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: verticalPadding,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TopicsScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: buttonFontSize,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
