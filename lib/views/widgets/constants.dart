import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:major_project/controllers/auth_controller.dart';
import 'package:major_project/views/screens/exercise_screen.dart';
import 'package:major_project/views/screens/home_screen.dart';
import 'package:major_project/views/screens/muscles.dart';
import 'package:major_project/views/screens/profile_screen.dart';


List pages = [
  HomePage(),
  ExercisePage(),
 MusclesPage(),
  ProfileScreen(),
  
];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Color.fromARGB(255, 220, 110, 20);
const borderColor = Colors.grey;

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;
