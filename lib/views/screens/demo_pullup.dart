import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:major_project/views/screens/login_screen.dart';

class PullUpDemo extends StatelessWidget {
  const PullUpDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pull Ups Demo"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Image for transition effect
            Padding(
              padding: const EdgeInsets.all(18),
              child: Hero(
                tag: 'pullupHero', // Unique tag for the hero transition
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Circular rectangle shape
                  child: Image.asset(
                    'assets/images/demo3.jpg', // Path to your image
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover, // Cover the container
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Why Pull Ups?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Description Text
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Text(
                "Pull-ups are a fundamental exercise that primarily targets the upper body, particularly the back and biceps. This exercise helps build strength and muscle endurance, improving your overall fitness.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
             // Row of buttons for AR and Camera
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // View In AR Button
                ElevatedButton(
                  onPressed: () {
                    // Handle AR view
                    print("View In AR clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text("View In AR"),
                ),
                const SizedBox(width: 20),

                // View In Camera Button
                ElevatedButton(
                  onPressed: () {
                    // Show login alert dialog
                    _showLoginAlertDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text("View In Camera"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Start Body Tracking Button
            ElevatedButton(
              onPressed: () {
                // Show login alert dialog
                _showLoginAlertDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
              ),
              child: const Text("Start Body Tracking"),
            ),
          ],
        ),
      ),
    );
  }
}

// Method to show login alert dialog
  void _showLoginAlertDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("Login Required"),
          content: const Text("Please log in to continue."),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const Text("Login"),
            ),
          ],
        );
      },
    );
  }
