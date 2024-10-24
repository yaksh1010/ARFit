import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/exercise.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
