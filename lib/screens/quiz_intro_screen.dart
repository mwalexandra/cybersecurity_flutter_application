import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'quiz_screen.dart';

class QuizIntroScreen extends StatelessWidget {
  const QuizIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkgrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.assignment_turned_in, size: 100, color: AppColors.darkpink),
              const SizedBox(height: 24),
              const Text(
                'You have completed the training. \n\n Next, a short quiz will follow with questions about what you have learned.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.darkblue,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // back to Training
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightpink,
                    ),
                    child: const Text('Back', style: TextStyle(color: AppColors.darkblue)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const QuizScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkblue,
                    ),
                    child: const Text('Start Quiz'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
