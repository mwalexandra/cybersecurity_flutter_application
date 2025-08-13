import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:cybersecurity_flutter_application/screens/quiz_intro_screen.dart';

class TrainingPage {
  final String text;
  final String? imagePath;
  final String? youtubeUrl;

  TrainingPage({required this.text, this.imagePath, this.youtubeUrl});
}

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  int currentPage = 0;
  YoutubePlayerController? _youtubeController;

  final List<TrainingPage> pages = [
    TrainingPage(
      text: 'Cybersecurity means protecting your data, devices, and identity online.\n\n It has become a critical concern in our increasingly digital world.\n\n Global Surge: In the third quarter of 2024, organizations experienced an average of 1,876 cyberattacks per week, marking a 75% increase compared to the same period in 2023. \n\n Global Cost: Cybercrime is projected to cost the world 9.5 trillion USD annually in 2024',
      imagePath: 'assets/images/training_imgs/training1.jpg',
    ),
    TrainingPage(
      text: 'Use strong and unique passwords for different services.\n\n Between April 2024 and April 2025, over 19 billion passwords were leaked across more than 200 data breaches. \n\n Alarmingly, 94% of these passwords were either reused or easily guessable, with only 6% being unique.',
      imagePath: 'assets/images/training_imgs/training2.jpg',
    ),
    TrainingPage(
      text: 'Best Practices for Password Security: \n\n Use Strong, Unique Passwords (at least 14 characters long).\n\n Regularly Update Passwords. \n\n Utilize Password Managers. \n\n Enable Multi-Factor Authentication (MFA).',
      imagePath: 'assets/images/training_imgs/bruteforce.png',
    ),
    TrainingPage(
      text: 'Recognizing Phishing: \n\n Watch this short video to learn how to avoid it.',
      youtubeUrl: 'https://youtu.be/gWGhUdHItto?si=6vJ1Wcfs423nrPbb',
    ),
    TrainingPage(
      text: 'Public Wi-Fi networks are not secure. \n\n A study from Cloudwards.net revealed that 43% of users on unsecured public Wi-Fi networks have experienced data breaches.\n\n Use a VPN or mobile data instead.',
      imagePath: 'assets/images/training_imgs/training3.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initYoutube();
  }

  void _initYoutube() {
    final current = pages[currentPage];
    if (current.youtubeUrl != null) {
      final videoId = YoutubePlayer.convertUrlToId(current.youtubeUrl!);
      _youtubeController = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    } else {
      _youtubeController?.dispose();
      _youtubeController = null;
    }
  }

  void nextPage() {
    if (currentPage < pages.length - 1) {
      setState(() {
        currentPage++;
        _initYoutube(); 
      });
    } else {
      Navigator.pushReplacement( // there is no back button
        context,
        MaterialPageRoute(builder: (context) => const QuizIntroScreen()),
      );
    }
  }

  void prevPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
        _initYoutube();
      });
    }
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
    super.dispose();
  }

/*  @override
  Widget build(BuildContext context) {
    final page = pages[currentPage];

    return Scaffold(
      backgroundColor: AppColors.darkblue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              if (page.youtubeUrl != null && _youtubeController != null)
                YoutubePlayerBuilder(
                  player: YoutubePlayer(
                  controller: _youtubeController!,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: AppColors.lightpink,
                  onReady: () {
                    debugPrint('Player is ready.');
                  },
                ),
                  builder: (context, player) {
                    return Column(
                      children: [
                        player,
                        const SizedBox(height: 24),
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
                    );
                  },
                )
              else ... [
                if (page.imagePath != null)
                Image.asset(
                  page.imagePath!,
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
              const Spacer(),
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
  }*/

  @override
  Widget build(BuildContext context) {
    final page = pages[currentPage];
    final screenWidth = MediaQuery.of(context).size.width;

    if(screenWidth < 600){
      return _buildMobileLayout(context, page);
    } else if(screenWidth < 1200) {
      return _buildTabletLayout(context, page);
    } else {
      return _buildDesktopLayout(context, page);
    } 
  }

  Widget _buildMobileLayout(BuildContext context, TrainingPage page) {
    return Scaffold(
      backgroundColor: AppColors.darkblue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: _buildContent(context, page, 200, 16),
        ),
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context, TrainingPage page) {
    return Scaffold(
      backgroundColor: AppColors.darkblue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 32.0),
          child: _buildContent(context, page, 300, 20),
        ),
      ),
    );
  }

  Widget _buildWebLayout(BuildContext context, TrainingPage page) {
    return Scaffold(
      backgroundColor: AppColors.darkblue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 40.0),
          child: _buildContent(context, page, 400, 22),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, TrainingPage page, double mediaHeight, double fontSize) {
    return Column(
      children: [
        if (page.youtubeUrl != null && _youtubeController != null)
          YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _youtubeController!,
              showVideoProgressIndicator: true,
              progressIndicatorColor: AppColors.lightpink,
            ),
            builder: (context, player) {
              return Column(
                children: [
                  SizedBox(height: mediaHeight, child: player),
                  const SizedBox(height: 24),
                  Text(
                    page.text,
                    style: TextStyle(
                      fontSize: fontSize,
                      color: Colors.white,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          )
        else ...[
          if (page.imagePath != null)
            Image.asset(
              page.imagePath!,
              height: mediaHeight,
              fit: BoxFit.contain,
            ),
          const SizedBox(height: 24),
          Text(
            page.text,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (currentPage > 0)
              ElevatedButton(
                onPressed: prevPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightgrey,
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
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
              const SizedBox(width: 100),
            ElevatedButton(
              onPressed: nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightpink,
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
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
        ),
      ],
    );
  }
}
