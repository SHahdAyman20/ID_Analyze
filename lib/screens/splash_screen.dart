import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:id_analyze/screens/home_page.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: FlutterSplashScreen(
          useImmersiveMode: true,
          duration: const Duration(seconds: 5),
          nextScreen: const HomePage(),
          backgroundColor: Colors.white,
          splashScreenBody: Center(
            child: Lottie.asset(
              "assets/Animation -2.json",
              repeat: true,
            ),
          ),
        )
    );
  }
}
