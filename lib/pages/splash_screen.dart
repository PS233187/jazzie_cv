import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:jazzies_cv/pages/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const int lottieAnimationDuration = 2;
    const int numberOfLoops = 2;
    final int totalDuration = lottieAnimationDuration * numberOfLoops * 1000;


    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: LottieBuilder.asset(
          "assets/lottie/cartoon_me_splash.json",
          repeat: true,
          width: screenWidth,
          height: screenHeight,
          fit: BoxFit.cover,
          onLoaded: (composition) {
            Future.delayed(Duration(milliseconds: totalDuration), () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            });
          },
        ),
      ),
    );
  }
}
