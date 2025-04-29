import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'login.dart'; // Importing the login screen to allow navigation

// A stateless widget for the Sign Up screen
class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background to white
      body: SingleChildScrollView( // Enables scrolling for smaller screens
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20), // Horizontal padding around the content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
            children: [
              const SizedBox(height: 50), // Add spacing from the top

              // Header text
              const Text(
                "Create an account,",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Subtext/Instructions
              const Text(
                "Please type full information below and we can create your account",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 60),

              // Name input field
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outline), // Icon inside the field
                  hintText: "Name",
                  filled: true,
                  fillColor: const Color(0xFFF0F3F6), // Light background color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40), // Rounded corners
                    borderSide: BorderSide.none, // No visible border line
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Email input field
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: "Email address",
                  filled: true,
                  fillColor: const Color(0xFFF0F3F6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Mobile number input field
              TextField(
                keyboardType: TextInputType.phone, // Opens phone keyboard
                decoration: InputDecoration(
                  prefixIcon: Row( // Custom prefix: country code and flag
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 10),
                      const Icon(Icons.flag_outlined, size: 18),
                      const SizedBox(width: 5),
                      const Text("+01", style: TextStyle(fontSize: 14)),
                      const SizedBox(width: 10),
                    ],
                  ),
                  hintText: "Mobile number",
                  filled: true,
                  fillColor: const Color(0xFFF0F3F6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Password input field
              TextField(
                obscureText: true, // Hides password characters
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText: "Password",
                  filled: true,
                  fillColor: const Color(0xFFF0F3F6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton( // Visibility toggle icon (not functional here)
                    icon: const Icon(Icons.visibility_off_outlined),
                    onPressed: () {},
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Terms and Conditions text
              const Text.rich(
                TextSpan(
                  text: "By signing up you agree to our ",
                  style: TextStyle(color: Color.fromARGB(255, 86, 86, 86), fontSize: 16),
                  children: [
                    TextSpan(
                      text: "Term of use",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: " and ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: "privacy notice",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // "Join Now" button
              ElevatedButton(
                onPressed: () {}, // TODO: Add sign-up logic
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF026A75), // Custom button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40), // Rounded edges
                  ),
                  minimumSize: const Size(double.infinity, 50), // Full-width button
                ),
                child: const Text(
                  "Join Now",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),

              // Divider with "or"
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1)), // Left line
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or", style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider(thickness: 1)), // Right line
                ],
              ),
              const SizedBox(height: 20),

              // Google sign-in button
              OutlinedButton.icon(
                onPressed: () {}, // TODO: Add Google sign-in logic
                icon: Image.asset(
                  'assets/images/Icon.png', // Google icon image
                  height: 24,
                  width: 24,
                ),
                label: const Text(
                  "Join with Google",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // Full-width button
                  side: const BorderSide(color: Color(0xFF026A75)), // Border color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Link to login screen if user already has an account
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                    children: [
                      TextSpan(
                        text: "Sign In",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          // Navigate to the login screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
