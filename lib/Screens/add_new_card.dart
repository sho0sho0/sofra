import 'package:flutter/material.dart';
import 'package:sofra_app/main.dart'; // Importing main.dart where your mainBackgroundColor is probably defined

// Create a StatefulWidget because we need to manage the selection state
class AddNewCard extends StatefulWidget {
  const AddNewCard({super.key});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  int selectedIndex = -1; // Track which button (card type) is selected

  // Function to handle selecting a button
  void selectButton(int index) {
    setState(() {
      selectedIndex = index; // Update the selected button's index
    });
  }

  @override
  Widget build(BuildContext context) {
    // Getting screen width and height to make the design responsive
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // Get the safe area (status bar) padding
    double safeTopPadding = MediaQuery.of(context).padding.top;

    // Dynamic padding and sizing based on screen dimensions
    double appBarPadding = screenWidth * 0.03;
    double iconSize = screenWidth * 0.06;
    double topPadding =
        safeTopPadding + appBarPadding; // Total padding at the top

    // List of images for the card types
    final List<String> imagePaths = [
      'assets/card.png',
      'assets/vcash.png',
      'assets/instapay.png'
    ];

    return Scaffold(
      backgroundColor: mainBackgroundColor, // Set background color
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90), // Custom AppBar height
        child: Padding(
          padding: EdgeInsets.only(
            top: topPadding,
            left: appBarPadding,
            right: appBarPadding,
          ),
          child: Stack(
            children: [
              // Back arrow button
              Positioned(
                top: screenHeight * 0.015,
                left: screenWidth * 0.02,
                child: CircleAvatar(
                  backgroundColor:
                      const Color(0xffff5f6fa), // Light grey background
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: iconSize,
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Go back to previous screen
                    },
                  ),
                ),
              ),
              // Centered Title
              Positioned(
                top: screenHeight * 0.02,
                right: screenWidth * 0.00156,
                left: screenWidth * 0.00156,
                child: Center(
                  child: Text(
                    "Add New Card",
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
          // Buttons for selecting the card type
          Padding(
            padding: EdgeInsets.only(
              top: 0,
              left: screenWidth * 0.0444,
            ),
            child: Row(
              children: List.generate(imagePaths.length, (index) {
                bool isSelected =
                    selectedIndex == index; // Check if button is selected
                return Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.0444),
                  child: SizedBox(
                    width: screenWidth * 0.273888,
                    height: screenHeight * 0.0703125,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected
                            ? const Color(0xFFF7F2E9) // Selected button color
                            : const Color(
                                0xFFF5F6FA), // Unselected button color
                        elevation: 0,
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.00625,
                            horizontal: screenWidth * 0.0111),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.02777),
                          side: BorderSide(
                            color: isSelected
                                ? const Color(0xFF026A75) // Border for selected
                                : Colors.transparent, // No border otherwise
                            width: 2,
                          ),
                        ),
                      ),
                      onPressed: () =>
                          selectButton(index), // Select card on press
                      child: Image.asset(
                        imagePaths[index],
                        width: screenWidth * 0.8333,
                        height: screenHeight * 0.0468,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          // Label for Card Owner
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.109375,
              left: screenWidth * 0.0444,
            ),
            child: Text(
              'Card Owner',
              style: TextStyle(
                  fontSize: screenWidth * 0.041666,
                  fontWeight: FontWeight.w500),
            ),
          ),

          // TextField for Card Owner Name
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.15,
              left: screenWidth * 0.0444,
              right: screenWidth * 0.0444,
            ),
            child: TextField(
              cursorHeight: screenHeight * 0.0234,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffff5f6fa),
                hintText: 'Enter your card name here...',
                hintStyle: TextStyle(
                    color: const Color(0xfff8f959e),
                    fontSize: screenWidth * 0.0333),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.02777),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: screenWidth * 0.0222),
              ),
            ),
          ),

          // Label for Card Number
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.24375,
              left: screenWidth * 0.0444,
            ),
            child: Text(
              'Card Number',
              style: TextStyle(
                  fontSize: screenWidth * 0.041666,
                  fontWeight: FontWeight.w500),
            ),
          ),

          // TextField for Card Number
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.284375,
              left: screenWidth * 0.0444,
              right: screenWidth * 0.0444,
            ),
            child: TextField(
              cursorHeight: screenHeight * 0.0234,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffff5f6fa),
                hintText: 'Enter your card number here...',
                hintStyle: TextStyle(
                    color: const Color(0xfff8f959e),
                    fontSize: screenWidth * 0.0333),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.02777),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: screenWidth * 0.0222),
              ),
            ),
          ),

          // Label for EXP
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.378125,
              left: screenWidth * 0.0444,
            ),
            child: Text(
              'EXP',
              style: TextStyle(
                  fontSize: screenWidth * 0.041666,
                  fontWeight: FontWeight.w500),
            ),
          ),

          // TextField for EXP (Expiration Date)
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.41875,
              left: screenWidth * 0.0444,
            ),
            child: SizedBox(
              width: screenWidth * 0.4333,
              child: TextField(
                cursorHeight: screenHeight * 0.0234,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffff5f6fa),
                  hintText: 'Enter your EXP here...',
                  hintStyle: TextStyle(
                      color: const Color(0xfff8f959e),
                      fontSize: screenWidth * 0.0333),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02777),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.0222),
                ),
              ),
            ),
          ),

          // Label for CVV
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.378125,
              left: screenWidth * 0.52777,
            ),
            child: Text(
              'CVV',
              style: TextStyle(
                  fontSize: screenWidth * 0.041666,
                  fontWeight: FontWeight.w500),
            ),
          ),

          // TextField for CVV
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.41875,
              left: screenWidth * 0.5222,
            ),
            child: SizedBox(
              width: screenWidth * 0.4333,
              child: TextField(
                cursorHeight: screenHeight * 0.0234,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffff5f6fa),
                  hintText: 'Enter your CVV here...',
                  hintStyle: TextStyle(
                      color: const Color(0xfff8f959e),
                      fontSize: screenWidth * 0.0333),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02777),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.0222),
                ),
              ),
            ),
          ),

          // Save Card Button
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.703125,
              left: screenWidth * 0.0444,
              right: screenWidth * 0.0444,
              bottom: screenHeight * 0.0375,
            ),
            child: SizedBox(
              width: screenWidth * 0.9111,
              child: ElevatedButton(
                onPressed:
                    () {}, // Functionality for saving the card can be added
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF026A75), // Button color
                  foregroundColor: const Color(0xFFF9FAFA),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.0203,
                  ),
                ),
                child: Text(
                  'Save Card',
                  style: TextStyle(
                      fontSize: screenWidth * 0.041666,
                      color: const Color(0xFFFFFFFF)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
