import 'package:flutter/material.dart';

// Entry point of the Flutter application
void main() {
  runApp(MyApp()); // Runs the MyApp widget
}

// Root widget of the app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: TransferFailedScreen(), // Sets the home screen to TransferFailedScreen
    );
  }
}

// Screen that displays the "Transfer Failed" message
class TransferFailedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255), // Sets a light pink background color
      body: LayoutBuilder( // Provides constraints of the parent widget
        builder: (context, constraints) {
          return SingleChildScrollView( // Enables scrolling if needed (e.g., on smaller screens)
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight, // Makes the content fill the screen height
              ),
              child: IntrinsicHeight( // Ensures children take up the minimum height needed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Centers content vertically
                  children: [
                    const SizedBox(height: 200), // Adds spacing from the top

                    // Image showing a failure icon
                    Container(
                      child: Image.asset(
                        'assets/images/failed.png', // Path to the image asset
                        width: constraints.maxWidth * 0.5, // Image takes 50% of screen width
                      ),
                    ),
                    const SizedBox(height: 24), // Spacing between image and text

                    // Title text
                    const Text(
                      'Transfer Failed',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8), // Spacing between title and description

                    // Description text
                    const Text(
                      'Your transfer has been declined\ndue to a technical issue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(), // Pushes the button to the bottom of the screen

                    // "Back to wallet" button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16), // Horizontal padding
                      child: SizedBox(
                        width: constraints.maxWidth * 0.9, // Button takes 90% of screen width
                        height: 50, // Button height
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Add functionality to navigate back to wallet
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF026A75), // Button color (teal)
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25), // Rounded corners
                            ),
                          ),
                          child: const Text(
                            'Back to wallet',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Button text color
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Bottom spacing
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
