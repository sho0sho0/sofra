// Importing required Dart and Flutter libraries
import 'dart:async'; // For using Timer
import 'package:flutter/gestures.dart'; // For gesture recognizer in RichText
import 'package:flutter/material.dart'; // For building UI elements
import 'signup.dart'; // Importing the signup screen

// Entry point of the app
void main() => runApp(const MyApp());

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: const SplashScreen(), // Sets the splash screen as the home page
    );
  }
}

// Splash screen that appears on app startup
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0; // Initial opacity for the logo (invisible)

  @override
  void initState() {
    super.initState();

    // Delayed opacity change to trigger a fade-in effect
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Navigate to LoginScreen after a 3-second delay
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF026A75), // Background color
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 2), // Duration of the fade-in
          opacity: _opacity, // Current opacity value
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
            children: [
              Image.asset(
                'assets/images/Logo (1).png', // Logo image path
                width: MediaQuery.of(context).size.width * 0.5, // Responsive width
                height: MediaQuery.of(context).size.width * 0.5, // Responsive height
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Login screen UI
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height; // Get screen height
    final screenWidth = MediaQuery.of(context).size.width; // Get screen width

    return Scaffold(
      backgroundColor: Colors.white, // Set background color
      body: SingleChildScrollView( // Allows vertical scrolling
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Horizontal padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start (left)
            children: [
              SizedBox(height: screenHeight * 0.1), // Space from top
              const Text(
                "Welcome back,", // Title text
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5), // Small space
              const Text(
                "Glad to meet you again!, please login to use the app.", // Subtitle text
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: screenHeight * 0.15), // Space before form

              // Email text field
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email), // Icon before text
                  labelText: "Email", // Label text
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28), // Rounded border
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02), // Spacing

              // Password text field
              TextField(
                obscureText: true, // Hide input
                decoration: InputDecoration(
                  fillColor: const Color(0xFFF0F3F6),
                  filled: true,
                  prefixIcon: const Icon(Icons.lock_outline),
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Color(0xFFF0F3F6)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Color(0xFFF0F3F6)),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {}, // Password visibility toggle
                    icon: const Icon(Icons.visibility_outlined),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.01),

              // Forgot password link aligned to the right
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {}, // Forgot password action
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.1),

              // Sign In button
              ElevatedButton(
                onPressed: () {}, // Sign-in action
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, screenHeight * 0.08),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: const Color(0xFF026A75), // Button color
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Divider with "or"
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or"),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),

              SizedBox(height: screenHeight * 0.02),

              // Google sign-in button
              OutlinedButton.icon(
                onPressed: () {}, // Google sign-in action
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, screenHeight * 0.08),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                icon: Image.asset(
                  'assets/images/Icon.png', // Google icon image path
                  height: screenHeight * 0.04,
                  width: screenWidth * 0.07,
                ),
                label: const Text(
                  "Sign In with Google",
                  style: TextStyle(color: Colors.grey),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              // RichText with tappable "Join Now" link
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: "Join Now",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to SignUpScreen on tap
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.05), // Bottom spacing
            ],
          ),
        ),
      ),
    );
  }
}
