import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utilities/images.dart';
import 'home_page.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  SplashScreenViewState createState() => SplashScreenViewState();
}

class SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    navigatorHome();
    super.initState();
  }

  navigatorHome() async {
    await Future.delayed(
      const Duration(seconds: 4),
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const HomePageView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Lottie.asset(ImagePaths.splashPath),
          ),
        ],
      ),
    );
  }
}
