// Importing the Flutter material design library
import 'package:flutter/material.dart';

// Entry point of the Flutter app
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Hides the debug banner in the top-right corner
    home: Scaffold(
      // App bar at the top of the screen
      appBar: AppBar(
        elevation: 0, // Removes the shadow under the app bar
        backgroundColor: Colors.transparent, // Makes the app bar background transparent
        automaticallyImplyLeading: false, // Removes the default back button
      ),
      
      // Body of the screen using LayoutBuilder for responsive design
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Defining responsive sizes based on the screen's dimensions
          double textSize = constraints.maxWidth * 0.07;       // Main text size
          double subTextSize = constraints.maxWidth * 0.045;   // Subtitle/button text size
          double fieldSpacing = constraints.maxHeight * 0.05;  // Spacing between text fields
          double buttonHeight = constraints.maxHeight * 0.07;  // Button height

          // Scrollable content to avoid overflow on small screens
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05), // Horizontal padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align items to the left
                children: [
                  SizedBox(height: constraints.maxHeight * 0.02), // Spacing from top
                  
                  // Main title
                  Text(
                    'New password,',
                    style: TextStyle(fontSize: textSize, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: constraints.maxHeight * 0.01), // Spacing

                  // Subtitle text
                  Text(
                    'Now, you can create new password and confirm it below',
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),

                  SizedBox(height: constraints.maxHeight * 0.12), // Spacing before text fields

                  // First password input field
                  TextField(
                    obscureText: true, // Hides the password input
                    decoration: InputDecoration(
                      hintText: 'New password', // Placeholder text
                      prefixIcon: const Icon(Icons.lock_outline), // Lock icon
                      filled: true,
                      fillColor: Color.fromARGB(255, 239, 241, 241), // Light grey background
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30), // Rounded corners
                        borderSide: BorderSide.none, // No visible border
                      ),
                    ),
                  ),

                  SizedBox(height: fieldSpacing), // Space between fields

                  // Confirm password input field
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirm new password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      filled: true,
                      fillColor: Color.fromARGB(255, 239, 241, 241),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  SizedBox(height: constraints.maxHeight * 0.2), // Space before button

                  // Confirm button
                  SizedBox(
                    width: double.infinity, // Full width button
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {}, // Button press handler (empty for now)
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF026A75), // Custom teal color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // Rounded corners
                        ),
                      ),
                      child: Text(
                        'Confirm New Password',
                        style: TextStyle(
                          fontSize: subTextSize * 0.8, // Button text size
                          color: Colors.white, // White text color
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: constraints.maxHeight * 0.02), // Bottom padding
                ],
              ),
            ),
          );
        },
      ),
    ),
  ));
}
