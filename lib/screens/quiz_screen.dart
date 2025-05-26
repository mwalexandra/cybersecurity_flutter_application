import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'quiz_result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Question> questions = [
    Question(
      text: 'What is phishing?',
      options: ['A type of malware', 'A fake website to steal data', 'VPN tool'],
      correctIndex: 1,
    ),
    Question(
      text: 'Should you use the same password for all accounts?',
      options: ['Yes', 'No'],
      correctIndex: 1,
    ),
  ];

  final Map<int, int> selectedAnswers = {};
  bool showResult = false;

  int countCorrectAnswers() {
    int correct = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctIndex) {
        correct++;
      }
    }
    return correct;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkblue,
      appBar: AppBar(
        backgroundColor: AppColors.lightpink,
        elevation: 0,
        title: const Text(
          'Quiz',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final q = questions[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${index + 1}. ${q.text}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...List.generate(q.options.length, (optIndex) {
                        final isSelected = selectedAnswers[index] == optIndex;
                        final isCorrect = showResult && optIndex == q.correctIndex;
                        final isWrong = showResult &&
                            isSelected &&
                            optIndex != q.correctIndex;

                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            tileColor: isCorrect
                                ? AppColors.success
                                : isWrong
                                    ? AppColors.darkpink
                                    : AppColors.darkgrey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            title: Text(
                              q.options[optIndex],
                              style: const TextStyle(color: Colors.white),
                            ),
                            onTap: showResult
                              ? null
                              : () {
                                  setState(() {
                                    selectedAnswers[index] = optIndex;
                                  });
                                },
                          ),
                        );
                      }),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizResultScreen(
                      total: questions.length,
                      correct: countCorrectAnswers(),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightpink,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: const Text('Check Answers'),
            ),
          ],
        ),
      ),
    );
  }
}

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
