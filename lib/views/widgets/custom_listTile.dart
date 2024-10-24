import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData leadingIcon; // Parameter for the leading icon
  final Color backgroundColor; // Parameter for the background color
  final VoidCallback? onTap; // Parameter for the onTap function

  const CustomListTile({
    Key? key,
    required this.title,
    required this.leadingIcon,
    this.backgroundColor = const Color.fromARGB(255, 45, 43, 43), // Default color
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Use GestureDetector for the onTap functionality
      onTap: onTap,
      child: ListTile(
        title: Container(
          decoration: BoxDecoration(
            color: backgroundColor, // Set the background color
            borderRadius: BorderRadius.circular(18.0),
            border: Border.all(
              color: const Color.fromARGB(255, 55, 50, 50), // Grey color for the border
              width: 2.0, // Thickness of the border
            ),
          ),
          padding: const EdgeInsets.all(10.0), // Optional padding for better appearance
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between text and icon
            children: [
              Row(
                children: [
                  Icon(leadingIcon), // Leading icon
                  const SizedBox(width: 8.0), // Space between icon and text
                  Text(title,), // Title text
                ],
              ),
              const Icon(Icons.arrow_forward_ios), // Add arrow icon inside the container
            ],
          ),
        ),
      ),
    );
  }
}
