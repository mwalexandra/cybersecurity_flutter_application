import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrainingPage {
  final String text;
  final String imagePath; // oder VideoPath

  TrainingPage({required this.text, required this.imagePath});
}

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  int currentPage = 0;

  final List<TrainingPage> pages = [
    TrainingPage(
      text: 'Cybersecurity means protecting your data, devices, and identity online.\n\n It has become a critical concern in our increasingly digital world. ',
      imagePath: 'assets/images/training_imgs/training1.jpg',
    ),
    TrainingPage(
      text: 'Use strong and unique passwords for different services.',
      imagePath: 'assets/images/training_imgs/training2.jpg',
    ),
    TrainingPage(
      text: 'Public Wi-Fi networks are not secure. Use a VPN or mobile data instead.',
      imagePath: 'assets/images/training_imgs/training3.jpg',
    ),
  ];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      setState(() => currentPage++);
    }
  }

  void prevPage() {
    if (currentPage > 0) {
      setState(() => currentPage--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final page = pages[currentPage];

    return Scaffold(
      backgroundColor: AppColors.darkblue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    // Image
                    Image.asset(
                      page.imagePath,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 24),
                    // Text
                    Text(
                      page.text,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  if (currentPage > 0)
                    ElevatedButton(
                      onPressed: prevPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightgrey,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(
                        fontSize: 20,
                        color: AppColors.darkblue,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 100), // Empty box

                  // Next Button
                  ElevatedButton(
                    onPressed: nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightpink,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                      fontSize: 20,
                      color: AppColors.darkblue,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
