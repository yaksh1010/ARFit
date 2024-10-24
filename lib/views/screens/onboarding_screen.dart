import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/views/screens/demo_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:major_project/views/screens/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 3;
              });
            },
            children: [
              buildOnboardingPage(
                color: Colors.black,
                image: 'assets/images/onboarding1.png',
                title: 'Welcome to the Fitness App',
                subtitle: 'Get in shape with personalized workout plans.',
              ),
              buildOnboardingPage(
                color: Colors.white,
                image: 'assets/images/onboarding2.png',
                title: 'Extensive Workout Libraries',
                subtitle: '100 Exercises just for you',
              ),
              buildOnboardingPage(
                color: Colors.white,
                image: 'assets/images/onboarding3.png',
                title: 'Achieve Your Goals',
                subtitle: 'Start your journey to a healthier, happier you!',
              ),
              buildOnboardingPage(
                color: Colors.white,
                image: 'assets/images/onboarding4.png',
                title: 'Achieve Your Goals',
                subtitle: 'Start your journey to a healthier, happier you!',
              ),
            ],
          ),
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 4,
                effect: WormEffect(
                  activeDotColor: Colors.black,
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: isLastPage
                ? ElevatedButton(
                    onPressed: () async {
                      // Mark onboarding as seen
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('hasSeenOnboarding', true);

                      // Navigate to the login screen
                      Get.off(() => DemoScreen());
                    },
                    child: Text('Get Started'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _pageController.jumpToPage(3);
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text('Next'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

 Widget buildOnboardingPage({
  required String image, // Image for content
  required String title,
  required Color color ,
  required String subtitle,
}) {
  return Scaffold(
    body: Stack(
      children: [
        Image.asset(
          
          image,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        // Content on top of the background image
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
         
          children: [
            const SizedBox(height: 430,),
            Text(
              title,
               textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: color, // Optional: Change text color for visibility
              ),
            ),
            SizedBox(height: 16),
            Text(
              subtitle,
              
              style: TextStyle(
                
                fontSize: 18,
                color: color, // Optional: Change text color for visibility
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    ),
  );
}
}