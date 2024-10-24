import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/views/screens/demo_pullup.dart';
import 'package:major_project/views/screens/demo_squats.dart';
import 'package:major_project/views/screens/login_screen.dart';
import 'package:major_project/views/screens/demo_pushups.dart';
import 'package:major_project/views/widgets/constants.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo"),
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "Here's a quick demo for a few exercises before you decide to log in to our app!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // First clickable container (Push Ups)
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(_createRoute());
                },
                child: Hero(
                  tag: 'pushupHero', // Unique tag for the hero transition
                  child: buildClickableContainer('assets/images/demo1.png', 'Push Ups'),
                ),
              ),
              const SizedBox(height: 20),
              // Second clickable container (Squats)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SquatsDemo()),
                  );
                },
                child: Hero(
                  tag: 'squatsHero', // Unique tag for the hero transition
                  child: buildClickableContainer('assets/images/demo2.png', 'Squats'),
                ),
              ),
              const SizedBox(height: 20),
              // Third clickable container (Pull Ups)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PullUpDemo()),
                  );
                },
                child: Hero(
                  tag: 'pullupHero', // Unique tag for the hero transition
                  child: buildClickableContainer('assets/images/demo3.jpg', 'Pull Ups'),
                ),
              ),
              const SizedBox(height: 40),
              // Skip to Login button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.off(() => LoginScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Skip to Login"),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Method to create a clickable container with background image
  Widget buildClickableContainer(String imagePath, String title) {
    return Container(
      width: 350,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Method for fade transition
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const PushUpDemo(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeInOut;

        var tween = Tween<double>(begin: begin, end: end).chain(CurveTween(curve: curve));
        var opacityAnimation = animation.drive(tween);

        return FadeTransition(
          opacity: opacityAnimation,
          child: child,
        );
      },
    );
  }
}
