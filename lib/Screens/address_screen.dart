import 'package:flutter/material.dart';
import 'package:sofra_app/main.dart';

// Preferred size for the custom AppBar
@override
Size get preferredSize {
  // Setting a fixed height for the app bar
  double appBarHeight = 90;
  return Size.fromHeight(appBarHeight);
}

// Main screen widget
class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

// State class for the AddressScreen
class _AddressScreenState extends State<AddressScreen> {
  bool isSwitched = false; // For the "Save as primary address" switch

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // Safe area padding (to avoid status bar)
    double safeTopPadding = MediaQuery.of(context).padding.top;

    // Dynamic values for padding and sizing
    double appBarPadding = screenWidth * 0.03; // 3% padding
    double iconSize = screenWidth * 0.06; // Icon size

    // Total top padding for AppBar
    double topPadding = safeTopPadding + appBarPadding;

    return Scaffold(
      backgroundColor: mainBackgroundColor, // Background color from main.dart
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(preferredSize.height),
        child: Padding(
          padding: EdgeInsets.only(
              top: topPadding, left: appBarPadding, right: appBarPadding),
          child: Stack(
            children: [
              // Back Button
              Positioned(
                top: screenHeight * 0.015,
                left: screenWidth * 0.02,
                child: CircleAvatar(
                  backgroundColor: const Color(0xffff5f6fa), // Light background
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: iconSize,
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Go back
                    },
                  ),
                ),
              ),
              // AppBar Title
              Positioned(
                top: screenHeight * 0.02,
                right: screenWidth * 0.00156,
                left: screenWidth * 0.00156,
                child: Center(
                  child: Text(
                    "Address",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // Name Label
          Positioned(
            top: screenHeight * 0.00625,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.0444),
              child: Text(
                'Name',
                style: TextStyle(
                    fontSize: screenWidth * 0.041666,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          // Name TextField
          Positioned(
            top: screenHeight * 0.046875,
            left: screenWidth * 0.0444,
            right: screenWidth * 0.0444,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffff5f6fa),
                hintText: 'Enter your name here...',
                hintStyle: TextStyle(
                    color: const Color(0xfff8f959e),
                    fontSize: screenWidth * 0.0333),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: screenWidth * 0.0222),
              ),
            ),
          ),
          // Country Label
          Positioned(
            top: screenHeight * 0.140625,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.0444),
              child: Text(
                'Country',
                style: TextStyle(
                    fontSize: screenWidth * 0.041666,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          // Country TextField
          Positioned(
            top: screenHeight * 0.18125,
            left: screenWidth * 0.0444,
            child: SizedBox(
              width: screenWidth * 0.4333,
              child: TextField(
                cursorHeight: screenHeight * 0.0234,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffff5f6fa),
                  hintText: 'Enter your country here...',
                  hintStyle: TextStyle(
                      color: const Color(0xfff8f959e),
                      fontSize: screenWidth * 0.0333),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.0222),
                ),
              ),
            ),
          ),
          // City Label
          Positioned(
            top: screenHeight * 0.140625,
            left: screenWidth * 0.4777,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.0444),
              child: Text(
                'City',
                style: TextStyle(
                    fontSize: screenWidth * 0.041666,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          // City TextField
          Positioned(
            top: screenHeight * 0.18125,
            left: screenWidth * 0.5222,
            child: SizedBox(
              width: screenWidth * 0.4333,
              child: TextField(
                cursorHeight: screenHeight * 0.0234,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffff5f6fa),
                  hintText: 'Enter your city here...',
                  hintStyle: TextStyle(
                      color: const Color(0xfff8f959e),
                      fontSize: screenWidth * 0.0333),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.0222),
                ),
              ),
            ),
          ),
          // Phone Number Label
          Positioned(
            top: screenHeight * 0.275,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.0444),
              child: Text(
                'Phone Number',
                style: TextStyle(
                    fontSize: screenWidth * 0.041666,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          // Phone Number TextField
          Positioned(
            top: screenHeight * 0.315625,
            left: screenWidth * 0.0444,
            right: screenWidth * 0.0444,
            child: TextField(
              cursorHeight: screenHeight * 0.0234,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffff5f6fa),
                hintText: 'Enter your phone number here...',
                hintStyle: TextStyle(
                    color: const Color(0xfff8f959e),
                    fontSize: screenWidth * 0.0333),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: screenWidth * 0.0222),
              ),
            ),
          ),
          // Address Label
          Positioned(
            top: screenHeight * 0.409375,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.0444),
              child: Text(
                'Address',
                style: TextStyle(
                    fontSize: screenWidth * 0.041666,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          // Address TextField
          Positioned(
            top: screenHeight * 0.45,
            left: screenWidth * 0.0444,
            right: screenWidth * 0.0444,
            child: TextField(
              cursorHeight: screenHeight * 0.0234,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffff5f6fa),
                hintText: 'Enter your address here...',
                hintStyle: TextStyle(
                    color: const Color(0xfff8f959e),
                    fontSize: screenWidth * 0.0333),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: screenWidth * 0.0222),
              ),
            ),
          ),
          // Save as primary address text
          Positioned(
            top: screenHeight * 0.55468,
            left: screenWidth * 0.0444,
            child: Text(
              'Save as primary address',
              style: TextStyle(
                  fontSize: screenWidth * 0.036111,
                  fontWeight: FontWeight.w500),
            ),
          ),
          // Switch widget
          Positioned(
            top: screenHeight * 0.53125,
            right: screenWidth * 0.0444,
            child: Transform.scale(
              scale: 0.7,
              child: Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value; // Update switch state
                  });
                },
                activeColor: Colors.white, // Thumb color when ON
                activeTrackColor: Colors.green, // Track color when ON
                inactiveThumbColor: Colors.white, // Thumb color when OFF
                inactiveTrackColor: Colors.grey, // Track color when OFF
              ),
            ),
          ),
          // Save Address Button
          Positioned(
            bottom: screenHeight * 0.0625,
            left: screenWidth * 0.0444,
            right: screenWidth * 0.0444,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Add saving address functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF026A75), // Button background
                foregroundColor: const Color(0xFFF9FAFA), // Text color
                elevation: 0,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.0203,
                ),
              ),
              child: Text(
                'Save Address',
                style: TextStyle(
                    fontSize: screenWidth * 0.041666,
                    color: const Color(0xFFFFFFFF)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
