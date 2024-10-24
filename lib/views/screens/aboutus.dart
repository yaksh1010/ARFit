import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Us',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Welcome to FitFreak, your comprehensive fitness companion designed for users of all ages and fitness levels—whether you’re a beginner, intermediate, or pro! Our mission is to empower individuals to achieve their health and wellness goals through personalized exercise and diet plans tailored to your unique profile.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Why We Created FitFreak',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'In a world where access to personal trainers can be limited and often costly, we recognized a pressing need for an affordable solution that provides quality fitness guidance. [App Name] bridges this gap by offering curated workout plans and dietary advice at no cost, making fitness accessible to everyone.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'What Makes Us Unique',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'One of the standout features of [App Name] is our cutting-edge body tracking technology, designed to help you perfect your form during workouts. This innovative approach not only enhances your exercise routine but also minimizes the risk of injury. Our augmented reality (AR) viewing of exercises brings your workouts to life, allowing you to see proper techniques in action.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Meet Our Team',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Our dedicated team of four is passionate about fitness and technology:\n\n'
                '- AR and Body Tracking Specialists (2): Focusing on immersive AR experiences and advanced body tracking.\n'
                '- Machine Learning Expert (1): Refining exercise and diet plans with AI technology.\n'
                '- Flutter Developer (1): Crafting a seamless user experience across the app.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
