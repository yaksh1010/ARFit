# ARFit
<img width="674" alt="ARFit" src="https://github.com/user-attachments/assets/fc503cc7-e56c-47c9-85d5-761702ebdaf7">

ARFit is an all-in-one solution for users looking to improve their fitness and health. It offers curated exercise plans, diet plans, and augmented reality (AR) viewing of workouts to help users maintain proper form. With features catering to all ages and fitness levels (beginner, intermediate, and pro), the app is designed to make fitness accessible and affordable for everyone.

## Features

- **Curated Workout Plans**: Personalized exercise routines based on user input, fitness level, and goals.
- **Diet Plans**: Tailored diet plans including macronutrient preferences (e.g., high-protein, low-carb, balanced).
- **Augmented Reality (AR) Workouts**: View exercises in AR for a better understanding of proper form and movement.
- **Body Tracking**: Uses body tracking to ensure correct posture during exercises.
- **Progress Tracking**: Monitor progress with in-app stats and analytics.

## Tech Stack

- **Frontend**: [Flutter](https://flutter.dev/)
- **Backend**: [Firebase](https://firebase.google.com/) (Authentication, Firestore Database, and Storage)
- **Machine Learning**: [TensorFlow](https://www.tensorflow.org/) for recommending workouts and diet plans
- **AR**: [Unity](https://unity.com/) for AR exercises integration
- **Body Tracking**: [OpenCV](https://opencv.org/) for real-time posture tracking
- **Version Control**: [GitHub](https://github.com/)

## Installation

To run this project locally, follow these steps:

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/yaksh1010/FitnessApp.git
   cd FitnessApp
   ```

2. **Setup Firebase:**

   - Create a new project in the [Firebase Console](https://console.firebase.google.com/).
   - Add an Android/iOS app to your Firebase project and download the `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS).
   - Place these files in their respective directories (`android/app` for Android and `ios/Runner` for iOS).
   - Enable Firebase Authentication, Firestore Database, and Storage in the Firebase Console.

3. **Install Dependencies:**

   ```bash
   flutter pub get
   ```

4. **Set Up Unity for AR Integration**:

   - Integrate Unity with Flutter by following [Unity Flutter Integration Guide](https://flutter.dev/docs/development/platform-integration/unity).
   - Add the Unity-generated files to the `unity/` directory in the Flutter project.

5. **Run the App:**

   ```bash
   flutter run
   ```


## Contributing

We welcome contributions from the community! To contribute to the ARFit:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Commit your changes and push them to your fork.
4. Create a pull request with a description of your changes.

Please ensure that your code follows the project's style guidelines and that you've tested it locally.

## Screenshots

<img width="475" alt="1" src="https://github.com/user-attachments/assets/f9a9dfa3-057b-4961-8d83-328243f9fdbc">
<img width="475" alt="2" src="https://github.com/user-attachments/assets/ea3436e1-33e4-4417-ac15-98bd9e9f7a2a">
<img width="475" alt="3" src="https://github.com/user-attachments/assets/47c4d5f4-fdd5-48f1-bb55-1b7abef55d86">
<img width="475" alt="4" src="https://github.com/user-attachments/assets/9c4d4ce0-0293-4081-87be-2f569b4339c8">
<img width="475" alt="5" src="https://github.com/user-attachments/assets/abc5583e-6ea6-4577-9c90-4a6df37a3ad4">
<img width="475" alt="6" src="https://github.com/user-attachments/assets/cda495a6-a710-45b0-bd3f-1a76b363932d">
<img width="475" alt="7" src="https://github.com/user-attachments/assets/6cb93ccb-6442-459f-acb5-5780f2d5790f">
<img width="475" alt="8" src="https://github.com/user-attachments/assets/47ff8a57-78d8-4714-bc53-e418b4221a12">
<img width="475" alt="9" src="https://github.com/user-attachments/assets/7c0959c6-8e6f-4d3b-b90c-9cb7fcb97835">


## Contact

For any questions or suggestions, please reach out to us:

- **Email**: yakshdalwadi1002@gmail.com
- **LinkedIn**: [Yakshraj](https://www.linkedin.com/in/yakshraj-dalwadi-85a940248/)
