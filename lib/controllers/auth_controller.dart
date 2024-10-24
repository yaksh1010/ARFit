import 'dart:ffi';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:major_project/views/screens/bottomNav.dart';
import 'package:major_project/views/screens/home_screen.dart';
import 'package:major_project/views/screens/login_screen.dart';
import 'package:major_project/models/user.dart' as model;
import 'package:major_project/views/widgets/constants.dart';
import 'package:flutter/cupertino.dart'; // Import Cupertino package

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user; // Stream to listen to authentication state changes
  late Rx<File?> _pickedImage; // To track the profile image

  File? get profilePhoto => _pickedImage.value;
  User get user => _user.value!;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
  }

  // Check user authentication status
  
  Future<void> checkUserLoggedInStatus() async {
    if (firebaseAuth.currentUser != null) {
      Get.offAll(() => bottomNav()); // Navigate to home screen if logged in
    } else {
      Get.offAll(() => LoginScreen()); // Navigate to login screen if not logged in
    }
  }

  void pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture', 'You have successfully selected your profile picture!');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  // Upload image to Firebase Storage
  Future<String> _uploadToStorage(File image) async {
    try {
      Reference ref = firebaseStorage.ref().child('profilePics').child(firebaseAuth.currentUser!.uid);
      UploadTask uploadTask = ref.putFile(image);
      TaskSnapshot snap = await uploadTask;
      String downloadUrl = await snap.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      Get.snackbar('Upload Error', 'Failed to upload image: $e');
      return '';
    }
  }

  // Registering the user
  void registerUser(
      String username,
      String email,
      String password,
      String age,
      String selectedGender, // Added parameter for gender
      List<bool> selectedGoals, // Added parameter for goals
      int selectedWeight, // Added parameter for weight
      int selectedHeight, // Added parameter for height
      int experience, // Added parameter for experience
      double fitnessLevel, // Added parameter for fitness level
      List<String> selectedTags, // Added parameter for tags
      Set<String> selectedDiets, // Added parameter for diets
      int selectedCalories, // Added parameter for calories
      int suppliment, // Added parameter for supplement
      int selectedDays, // Added parameter for days
      String? selectedSleepQuality // Added parameter for sleep quality
      ) async {
    try {
      if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty && age.isNotEmpty) {
        // Register user in Firebase Auth
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Create user model and save to Firestore
        model.User user = model.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
          age: age,
          selectedGender: selectedGender,
          selectedGoals: selectedGoals,
          selectedWeight: selectedWeight,
          selectedHeight: selectedHeight,
          experience: experience,
          fitnessLevel: fitnessLevel,
          selectedTags: selectedTags,
          selectedDiets: selectedDiets,
          selectedCalories: selectedCalories,
          suppliment: suppliment,
          selectedDays: selectedDays,
          selectedSleepQuality: selectedSleepQuality,
        );

        await firestore.collection('users').doc(cred.user!.uid).set(user.toJson());

        // Navigate to the home screen after successful registration
        Get.offAll(() => const bottomNav());
      } else {
        Get.snackbar('Error Creating Account', 'Please enter all fields and select an image');
      }
    } catch (e) {
      Get.snackbar('Error Creating Account', e.toString());
    }
  }


  // Login user
  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        // Navigate to the bottom navigation screen after successful login
        Get.offAll(() => const bottomNav(),); // Use transition if desired
      } else {
        Get.snackbar('Error Logging In', 'Please enter both email and password');
      }
    } catch (e) {
      Get.snackbar('Error Logging In', e.toString());
    }
  }

  // Sign out user
  void signOut() async {
    showCupertinoDialog(
      context: Get.context!,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Confirm Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () {
                Get.back(); // Close the dialog
              },
            ),
            CupertinoDialogAction(
              child: const Text('Sign Out'),
              onPressed: () async {
                await firebaseAuth.signOut(); // Sign out from Firebase
                Get.offAll(() => LoginScreen(), transition: Transition.leftToRight); // Navigate to login screen
              },
            ),
          ],
        );
      },
    );
  }

  // Delete user account
  void deleteUser() async {
    showCupertinoDialog(
      context: Get.context!,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Confirm Account Deletion'),
          content: const Text('Are you sure you want to delete your account? This action cannot be undone.'),
          actions: [
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () {
                Get.back(); // Close the dialog
              },
            ),
            CupertinoDialogAction(
              child: const Text('Delete Account'),
              onPressed: () async {
                try {
                  // Deleting the user from Firebase
                  await firebaseAuth.currentUser!.delete();
                  // Navigate to the login screen or another appropriate screen after deletion
                  Get.offAll(() => LoginScreen(), transition: Transition.leftToRight);
                } catch (e) {
                  Get.snackbar('Error Deleting Account', e.toString());
                }
              },
            ),
          ],
        );
      },
    );
  }
}
