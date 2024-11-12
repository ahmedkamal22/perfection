import 'package:flutter/material.dart';
import 'package:perfection/core/utils/constants.dart';
import 'package:perfection/core/utils/widgets/custom_navigation_widgets.dart';
import 'package:perfection/features/home/presentation/pages/home_screen.dart';
import 'package:perfection/features/splash/presentation/widgets/perfection_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goToHomeScreen();
  }

  _goToHomeScreen() {
    Future.delayed(kDuration, () {
      navigateToAndFinish(context: context, location: const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOutExpo,
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, double value, child) {
            return Transform.scale(
              scale: value * 1.7,
              child: Opacity(
                opacity: value,
                child: child,
              ),
            );
          },
          child: const PerfectionLogo(),
        ),
      ),
    );
  }
}
