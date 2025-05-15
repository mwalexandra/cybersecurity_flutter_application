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
          seedColor: AppColors.darkpink,
          brightness: Brightness.dark,
        )
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/logo.svg',
                        width: 200,
                        height: 200,
                      ),
                      const SizedBox(height: 60),
                      Text(
                        "Cybersecurity",   
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roxborough-CF',
                          fontSize: 50,
                          color: AppColors.textPrimary, //TODO pink color
                          height: 1.2,
                        ),
                      ),
                      Text(
                        "TRAINING APP",    //Cybersecurity\n
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textPrimary, //TODO pink color
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 60),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightpink,
                          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          // TODO go to next screen
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
                ),
              )
            )
          ],
        )
      ),
    );
  }
}