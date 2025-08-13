class MobWelcomeScreen extends StatelessWidget {

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
                          color: AppColors.textPrimary, 
                          height: 1.2,
                        ),
                      ),
                      Text(
                        "TRAINING APP",    
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textPrimary, 
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
                ),
              )
            )
          ],
        )
      ),
    );
  }
}