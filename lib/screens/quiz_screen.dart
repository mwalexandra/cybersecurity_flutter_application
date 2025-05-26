import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'quiz_result_screen.dart';

class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  Question({
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Question> questions = [
    Question(
      text: 'What is phishing?',
      options: ['A VPN tool', 'A fake website to steal data', 'An antivirus program'],
      correctIndex: 1,
    ),
    Question(
      text: 'Should you use the same password everywhere?',
      options: ['Yes', 'No'],
      correctIndex: 1,
    ),
    Question(
      text: 'What should you check before clicking a link in an email?',
      options: ['The color of the email', 'The sender’s name only', 'The full URL and sender’s address'],
      correctIndex: 2,
    ),
    Question(
      text: 'Which of the following is a sign of a phishing email?',
      options: ['Personalized greeting', 'Spelling mistakes and urgent tone', 'Email from a colleague'],
      correctIndex: 1,
    ),
    Question(
      text: 'Is it safe to click on links in unexpected emails?',
      options: ['Yes', 'No'],
      correctIndex: 1,
    ),

    Question(
      text: 'Should you use public Wi-Fi for banking or shopping?',
      options: ['Yes', 'No'],
      correctIndex: 1,
    ),
  ];

  int currentIndex = 0;
  Map<int, int> selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];
    final selected = selectedAnswers[currentIndex];

    return Scaffold(
      backgroundColor: AppColors.lightpink,
      appBar: AppBar(
        backgroundColor: AppColors.grey,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Quiz', 
          style: TextStyle(
            color: AppColors.darkblue,
            fontFamily: 'Roxborough-CF',
            fontSize: 28,
          )
        ),
        leading: (currentIndex > 0)
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.darkpink),
              onPressed: () {
                setState(() => currentIndex--);
              },
            )
          : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentIndex + 1} of ${questions.length}',
              style: const TextStyle(
                color: AppColors.darkblue,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              question.text,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 24),
            // Answers
            ...List.generate(question.options.length, (i) {
              final isSelected = selected == i;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAnswers[currentIndex] = i;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: isSelected ? AppColors.darkgrey : AppColors.lightgrey,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedAnswers[currentIndex] = i;
                        });
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Text(
                        question.options[i],
                        style: TextStyle(
                          color: AppColors.darkblue,
                          fontSize: 18,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),  
                    ),
                  ),
                ),
              );
            }),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: selected != null
                    ? () {
                        if (currentIndex < questions.length - 1) {
                          setState(() => currentIndex++);
                        } else {
                          final correct = countCorrect();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => QuizResultScreen(
                                total: questions.length,
                                correct: correct,
                              ),
                            ),
                          );
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkpink,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                ),
                child: Text(
                  currentIndex < questions.length - 1 ? 'Next' : 'Finish',
                  style: const TextStyle(color: AppColors.black)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  int countCorrect() {
    int correct = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctIndex) {
        correct++;
      }
    }
    return correct;
  }
}
