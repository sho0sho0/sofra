import 'package:flutter/material.dart';

void main() {
  // Entry point of the app
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Hide the debug banner on the top right
    home: Scaffold(
      appBar: AppBar(
        elevation: 0, // Remove shadow under the app bar
        backgroundColor: Colors.transparent, // Make the app bar background transparent
        automaticallyImplyLeading: false, // Disable default back button
      ),
      body: LayoutBuilder(
        // LayoutBuilder gives access to the parent constraints (width & height)
        builder: (context, constraints) {
          // Responsive sizing based on screen width and height
          double textSize = constraints.maxWidth * 0.07;
          double subTextSize = constraints.maxWidth * 0.045;
          double fieldSpacing = constraints.maxHeight * 0.05;
          double buttonHeight = constraints.maxHeight * 0.07;

          return Padding(
            // Add horizontal padding to the content
            padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
              children: [
                // Header text
                Text(
                  'Forgot password,',
                  style: TextStyle(fontSize: textSize, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: constraints.maxHeight * 0.01), // Vertical space
                // Description text
                Text(
                  'Please type your email below and we will give you a OTP code',
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
                SizedBox(height: constraints.maxHeight * 0.12), // Space before the input field
                // Email input field
                TextField(
                  obscureText: true, // Hides input text like passwords (although not needed for email)
                  decoration: InputDecoration(
                    hintText: 'Email address', // Placeholder text
                    prefixIcon: const Icon(Icons.mail , color: Colors.grey,), // Mail icon inside input
                    filled: true, // Fill the background of the input
                    fillColor: Color(0xFFF0F3F6), // Background color of the input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                      borderSide: BorderSide.none, // No visible border
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.01), // Small space below input
                Align(
                  alignment: Alignment.centerRight, // Align this widget to the right
                  child: TextButton(
                    onPressed: () {}, // Action for phone number option
                    child: const Text(
                      "Use phone number?",
                      style: TextStyle(color: Color.fromARGB(255, 193, 192, 192)), // Grey text
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.5), // Large space before button
                // Submit button
                SizedBox(
                  width: double.infinity, // Button takes full width
                  height: buttonHeight, // Responsive height
                  child: ElevatedButton(
                    onPressed: () {}, // Action when button is pressed
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF026A75), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Rounded corners
                      ),
                    ),
                    child: Text(
                      'Send Code',
                      style: TextStyle(fontSize: subTextSize * 0.8, color: Colors.white), // Button text style
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  ));
}
