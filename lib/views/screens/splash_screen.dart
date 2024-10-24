import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/views/screens/onboarding_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart'; // Comment this out for now
// import 'package:major_project/controllers/auth_controller.dart';
// import 'package:major_project/views/screens/login_screen.dart';
// import 'package:major_project/views/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding(); // Navigate to onboarding directly
  }

  // Temporarily go directly to the onboarding screen
  Future<void> _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate splash duration
    Get.off(() => OnboardingScreen()); // Navigate to OnboardingScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6EDE4), // Set your desired
      body: Center(
        child: Image.asset(
          'assets/images/SplashLOGO.png',
          //opacity: _animation!,
          height: 300,
          width: 300,
        ), // Your splash logo
      ),
    );
  }
}
