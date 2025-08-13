import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/colors.dart';
import 'description_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      // Мобильная версия
      return _buildMobileLayout(context);
    } else if (screenWidth < 1200) {
      // Планшетная версия
      return _buildTabletLayout(context);
    } else {
      // Веб-версия
      return _buildWebLayout(context);
    }
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildCenteredContent(context, logoSize: 200, titleSize: 50, subtitleSize: 25, buttonPadding: 60),
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildCenteredContent(context, logoSize: 250, titleSize: 60, subtitleSize: 30, buttonPadding: 80),
      ),
    );
  }

  Widget _buildWebLayout(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64.0),
                child: _buildCenteredContent(context, logoSize: 300, titleSize: 70, subtitleSize: 35, buttonPadding: 100),
              ),
            ),
            Expanded(
              flex: 3,
              child: Image.asset(
                'assets/images/cybersecurity_banner.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenteredContent(BuildContext context, {
    required double logoSize,
    required double titleSize,
    required double subtitleSize,
    required double buttonPadding,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/logo.svg',
            width: logoSize,
            height: logoSize,
          ),
          const SizedBox(height: 60),
          Text(
            "Cybersecurity",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Roxborough-CF',
              fontSize: titleSize,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
          ),
          Text(
            "TRAINING APP",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: subtitleSize,
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightpink,
              padding: EdgeInsets.symmetric(horizontal: buttonPadding, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DescriptionScreen()),
              );
            },
            child: const Text(
              'Enter',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
