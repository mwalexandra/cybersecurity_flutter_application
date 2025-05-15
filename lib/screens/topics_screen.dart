import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  final List<String> topics = const [
    'What is Cybersecurity?',
    'Password Security',
    'Secure Communication',
    'Recognizing Phishing',
    'Behavior in Public Wi-Fi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkblue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                'Topics',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 24),
              ...topics.map(
                (topic) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_circle_right, color: AppColors.lightpink),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          topic,
                          style: const TextStyle(
                            fontSize: 18,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightpink,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    // TODO: переход к первому экрану обучения
                  },
                  child: const Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.darkblue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
