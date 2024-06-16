import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:jazzies_cv/pages/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const int lottieAnimationDuration = 2;
    const int numberOfLoops = 3;
    final int totalDuration = lottieAnimationDuration * numberOfLoops * 1000;

    // Haal de breedte en hoogte van het scherm op
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: LottieBuilder.asset(
          "assets/lottie/cartoon_me_splash.json",
          repeat: true,
          width: screenWidth, // Stel de breedte in op de schermbreedte
          height: screenHeight, // Stel de hoogte in op de schermhoogte
          fit: BoxFit.cover, // Zorg ervoor dat de animatie de gehele breedte en hoogte bedekt
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
