import 'package:flutter/material.dart';
import 'package:sofra_app/main.dart';

class ConfirmedScreen extends StatelessWidget {
  const ConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // Safe Area top inset (status bar height) to adjust space from top
    double safeTopPadding = MediaQuery.of(context).padding.top;

    // Adjusting dynamic values based on screen size
    double appBarPadding = screenWidth * 0.03; // 4% of screen width for padding
    double iconSize = screenWidth * 0.06; // Icon size relative to screen width

    // The total padding above the app bar to keep it consistent and responsive
    double topPadding = safeTopPadding +
        appBarPadding; // Adding safe top padding to the general padding

    return Scaffold(
      backgroundColor: mainBackgroundColor, // Background color defined globally
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Padding(
          padding: EdgeInsets.only(
            top: topPadding, // Padding based on screen size
            left: appBarPadding,
            right: appBarPadding,
          ),
          child: Stack(
            children: [
              // Positioned circle avatar for the back button
              Positioned(
                top: screenHeight * 0.015,
                left: screenWidth * 0.02,
                child: CircleAvatar(
                  backgroundColor: const Color(0xffff5f6fa),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: iconSize, // Icon size based on screen width
                    ),
                    onPressed: () {
                      Navigator.pop(
                          context); // Goes back to the previous screen
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // Positioned image for the background image of the screen
          Positioned(
            top: 0,
            left: 1,
            right: 1,
            child: Center(
              child: Image.asset(
                'assets/mobile.png', // The image asset used for the background
                height:
                    screenHeight * 0.40625, // Height relative to screen size
                width: screenWidth * 0.8888, // Width relative to screen size
                fit: BoxFit.fill, // Makes sure the image fills the area
              ),
            ),
          ),
          // Positioned text for the "Order ConfirmedScreen!" message
          Positioned(
            top: screenHeight * 0.4218,
            right: 1,
            left: 1,
            child: Center(
              child: Text(
                "Order ConfirmedScreen!",
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Bold text style
                  fontSize: screenWidth *
                      0.069444, // Font size relative to screen width
                  letterSpacing: screenWidth *
                      0.002777, // Letter spacing relative to screen width
                  wordSpacing: screenWidth *
                      0.005555, // Word spacing relative to screen width
                ),
              ),
            ),
          ),
          // Positioned text for the confirmation message
          Positioned(
            top: screenHeight * 0.484375,
            right: 1,
            left: 1,
            child: Center(
              child: Text(
                "Your order has been confirmedSConfirmedScreen, we will send\nyou confirmation email shortly.",
                style: TextStyle(
                  fontWeight: FontWeight.w400, // Regular font weight
                  fontSize: screenWidth *
                      0.041666, // Font size relative to screen width
                  color: Color(0xff8F959E), // Text color (grayish)
                ),
                textAlign: TextAlign.center, // Center align the text
              ),
            ),
          ),
          // Positioned "Continue Shopping" button at the bottom of the screen
          Positioned(
            bottom: screenHeight * 0.03906,
            left: screenWidth * 0.0444,
            right: screenWidth * 0.0444,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    primaryColor, // Background color from main theme
                foregroundColor: const Color(0xFFF9FAFA), // Button text color
                elevation: 0, // No shadow effect
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight *
                      0.0203, // Vertical padding relative to screen height
                ),
              ),
              child: Text(
                'Continue Shopping',
                style: TextStyle(
                    fontSize: screenWidth *
                        0.041666, // Font size relative to screen width
                    color: const Color(0xFFFFFFFF)), // Text color (white)
              ),
            ),
          ),
          // Positioned "Go to Orders" button below "Continue Shopping"
          Positioned(
            bottom: screenHeight * 0.140625,
            left: screenWidth * 0.0444,
            right: screenWidth * 0.0444,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.white, // Button background color (white)
                foregroundColor: primaryColor, // Text color (primary color)
                elevation: 0, // No shadow effect
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight *
                      0.0203, // Vertical padding relative to screen height
                ),
                side: BorderSide(
                    color: primaryColor), // Border color (primary color)
              ),
              child: Text(
                'Go to Orders',
                style: TextStyle(
                  fontSize: screenWidth *
                      0.041666, // Font size relative to screen width
                  color: primaryColor, // Text color (primary color)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
