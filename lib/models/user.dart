import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String age;
  String email;
  String uid;
  String selectedGender; // Added gender field
  List<bool> selectedGoals; // List of goals
  int selectedWeight; // Weight
  int selectedHeight; // Height
  int experience; // Experience level
  double fitnessLevel; // Fitness level
  List<String> selectedTags; // List of tags
  Set<String> selectedDiets; // List of diets
  int selectedCalories; // Selected calories
  int suppliment; // Supplement value
  int selectedDays; // Number of days committed
  String? selectedSleepQuality; // Sleep quality

  User({
    required this.name,
    required this.email,
    required this.uid,
    required this.age,
    required this.selectedGender,
    required this.selectedGoals,
    required this.selectedWeight,
    required this.selectedHeight,
    required this.experience,
    required this.fitnessLevel,
    required this.selectedTags,
    required this.selectedDiets,
    required this.selectedCalories,
    required this.suppliment,
    required this.selectedDays,
    required this.selectedSleepQuality,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "email": email,
        "uid": uid,
        "selectedGender": selectedGender,
        "selectedGoals": selectedGoals,
        "selectedWeight": selectedWeight,
        "selectedHeight": selectedHeight,
        "experience": experience,
        "fitnessLevel": fitnessLevel,
        "selectedTags": selectedTags,
        "selectedDiets": selectedDiets,
        "selectedCalories": selectedCalories,
        "suppliment": suppliment,
        "selectedDays": selectedDays,
        "selectedSleepQuality": selectedSleepQuality,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot['email'],
      age: snapshot['age'],
      uid: snapshot['uid'],
      name: snapshot['name'],
      selectedGender: snapshot['selectedGender'], // New field
      selectedGoals: List<bool>.from(snapshot['selectedGoals'] ?? []), // New field
      selectedWeight: snapshot['selectedWeight'], // New field
      selectedHeight: snapshot['selectedHeight'], // New field
      experience: snapshot['experience'], // New field
      fitnessLevel: snapshot['fitnessLevel'], // New field
      selectedTags: List<String>.from(snapshot['selectedTags'] ?? []), // New field
      selectedDiets: Set<String>.from(snapshot['selectedDiets'] ?? []), // New field
      selectedCalories: snapshot['selectedCalories'], // New field
      suppliment: snapshot['suppliment'], // New field
      selectedDays: snapshot['selectedDays'], // New field
      selectedSleepQuality: snapshot['selectedSleepQuality'], // New field
    );
  }
}
