// Importing necessary Flutter libraries
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Entry point of the Flutter application
void main() {
  runApp(const MyApp()); // Launch the app using MyApp widget
}

// Root widget of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: ReceiveScreen(), // Set the home screen to ReceiveScreen
    );
  }
}

// Stateless widget representing the Receive money screen
class ReceiveScreen extends StatelessWidget {
  ReceiveScreen({super.key});

  // Controller to handle the text input for the amount
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 🔹 Get screen width & height for responsive sizing
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[200], // Light gray background
      body: SafeArea( // Ensure content avoids system UI
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
          children:[
            // 🔹 Back arrow button at the top left
            Padding (
              padding: EdgeInsets.only(left: screenWidth * 0.04, top: screenHeight * 0.02),
              child: Align(
                alignment: Alignment.centerLeft, // Align back button to the left
                child: IconButton(
                  icon: Icon (Icons.arrow_back, size: screenWidth * 0.07), // Back icon
                  onPressed: () {
                    Navigator.pop(context); // Go back when pressed
                  },
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.02), // Spacing

            // 🔹 "Receive via" Title
            Text(
              "Receive via",
              style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: screenHeight * 0.015), // Spacing

            // 🔹 Circular image with teal border
            Container(
              padding: EdgeInsets.all(screenWidth * 0.008), // Border thickness
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle, // Make the container circular
                border: Border.all(color: Color(0xFF008080), width: screenWidth * 0.008), // Teal Border
              ),
              child: CircleAvatar(
                radius: screenWidth * 0.12, // Avatar radius
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/instapay.png"), // Instapay image
              ),
            ),

            SizedBox(height: screenHeight * 0.015), // Spacing

            // 🔹 Display mobile number label and value
            Text(
              "Mobile number",
              style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.005), // Spacing
            Text(
              "01112547638",
              style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.black54),
            ),

            SizedBox(height: screenHeight * 0.03), // Spacing

            // 🔹 Label for amount input
            Text(
              "Enter Amount",
              style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: screenHeight * 0.01), // Spacing

            // 🔹 Amount input field with dollar sign
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.12), // Input field horizontal padding
              child: TextField(
                controller: amountController, // Controller to retrieve text
                textAlign: TextAlign.center, // Center the text
                style: TextStyle(fontSize: screenWidth * 0.08, color: Colors.black),
                keyboardType: TextInputType.numberWithOptions(decimal: true), // Numeric input with decimals
                inputFormatters: [
                  // Allow only digits and optional decimal up to 2 places
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                decoration: InputDecoration(
                  prefixText: "\$", // Dollar sign as prefix
                  prefixStyle: TextStyle(fontSize: screenWidth * 0.08, color: Colors.black54),
                  border: InputBorder.none, // No border
                ),
              ),
            ),

            // 🔹 Divider line under the input field
            Divider(
              indent: screenWidth * 0.25, // Left spacing
              endIndent: screenWidth * 0.25, // Right spacing
              thickness: 2, // Divider thickness
              color: Color(0xFF026A75), // Custom teal color
            ),

            SizedBox(height: screenHeight * 0.3), // Large space before button

            // 🔹 Send button at the bottom
            SizedBox(
              width: double.infinity, // Full width button
              height: screenHeight * 0.065, // Button height
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Button horizontal padding
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF026A75), // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.06), // Rounded corners
                    ),
                  ),
                  onPressed: () {
                    // TODO: Handle send action (functionality not implemented yet)
                  },
                  child: Text(
                    'Send',
                    style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05), // Button text
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
