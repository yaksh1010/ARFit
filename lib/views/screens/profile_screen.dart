import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:major_project/controllers/auth_controller.dart';
import 'package:major_project/views/screens/aboutus.dart';
import 'package:major_project/views/screens/feedbacks.dart';
import 'package:major_project/views/screens/home_screen.dart';
import 'package:major_project/views/screens/login_screen.dart';
import 'package:major_project/views/widgets/constants.dart';
import 'package:major_project/views/widgets/custom_listTile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(child: Image.asset("assets/images/profile.jpg"),),
            const SizedBox(height: 20),
            Row(children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ]),
           
            CustomListTile(
                title: "Notification",
                leadingIcon: Icons.notifications,
                onTap: () {
                  // Navigate to Name Screen or any other screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }),
            CustomListTile(
              title: "Personal Information",
              leadingIcon: Icons.person,
              onTap: () {
                  
              }
                  
                  
            ),
            CustomListTile(
                title: "About Us",
                leadingIcon: Icons.list,
                onTap: () {
                  // Navigate to Name Screen or any other screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()),
                  );
                }),
                CustomListTile(
                title: "Submit Feedback",
                leadingIcon: Icons.feed_sharp,
                onTap: () {
                  // Navigate to Name Screen or any other screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackPage()),
                  );
                }),
                CustomListTile(
                title: "Help Center",
                leadingIcon: Icons.question_mark,
                onTap: () {
                  // Navigate to Name Screen or any other screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }),
                CustomListTile(
                  backgroundColor: Color.fromARGB(255, 208, 34, 22),
                title: "Delete Account",
                leadingIcon: Icons.delete,
                onTap: () {
                  // Navigate to Name Screen or any other screen
                 AuthController().deleteUser();
                }),
                CustomListTile(
                  backgroundColor: buttonColor,
                title: "Sign Out",
                leadingIcon: Icons.logout,
                onTap: () {
                  
                 AuthController().signOut();
                }),
          ],
        ),
      ),
    );
  }
}
