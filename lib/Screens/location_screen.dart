import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  bool _isLocationSelected = false; // Tracks if location is selected
  String _enteredAddress = ""; // Stores the entered or selected address

  // Method to select location and update the UI state
  void _selectLocation(String address) {
    setState(() {
      _isLocationSelected = true; // Location is now selected
      _enteredAddress = address; // Set the entered address
    });
  }

  // Method to reset the screen to the initial state
  void _resetScreen() {
    setState(() {
      _isLocationSelected = false; // Reset location selection
      _enteredAddress = ""; // Clear entered address
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive layout
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Ensures the body resizes when keyboard appears
      backgroundColor: Colors.white, // Sets background color of the screen
      body: SafeArea(
        child: SingleChildScrollView(
          // Allows scrolling when keyboard is open
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.08, // 8% of screen height
              right: screenWidth * 0.08,
              left: screenWidth * 0.08,
              bottom: screenHeight * 0.02, // Little padding at the bottom
            ),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Aligns the children at the top
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Centers children horizontally
              children: [
                // Location Icon with Map
                SizedBox(
                  height: screenHeight *
                      0.22, // Adjust height to 22% of screen height
                  width:
                      screenWidth * 0.4, // Adjust width to 40% of screen width
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: screenHeight * 0.22,
                        width: screenWidth * 0.4,
                        decoration: const BoxDecoration(
                          color: Color(0xfffffebe5), // Circle background color
                          shape: BoxShape.circle,
                        ),
                      ),
                      // Map Image
                      Container(
                        height: screenHeight *
                            0.13, // Adjust height to 14% of screen height
                        width: screenWidth *
                            0.23, // Adjust width to 24% of screen width
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/map.png'), // Add your map image here
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.04), // 4% of screen height

                // Title
                Text(
                  "Find Nearby Restaurants",
                  style: GoogleFonts.dmSans(
                    fontSize:
                        screenWidth * 0.065, // Font size based on screen width
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // 2% of screen height

                // Subtitle
                Text(
                  "Enter your location or allow access to your\nlocation to find restaurants near you.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    fontSize:
                        screenWidth * 0.035, // Font size based on screen width
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: screenHeight * 0.04), // 4% of screen height

                // Conditional rendering of containers
                _isLocationSelected
                    ? _buildSelectedLocationContainer(screenHeight, screenWidth)
                    : _buildInitialInputContainers(screenHeight, screenWidth),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Builds the initial input containers (buttons and text field)
  Widget _buildInitialInputContainers(double screenHeight, double screenWidth) {
    return Column(
      children: [
        // "Use Current Location" Button
        ElevatedButton(
          onPressed: () {
            _selectLocation("Current Location"); // Select current location
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF4F5F7), // Background color
            foregroundColor: const Color(0xFF172B4D), // Text color
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02), // Vertical padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
          ),
          child: Center(
            child: Text(
              "Use current location",
              style: GoogleFonts.dmSans(fontSize: screenWidth * 0.04),
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02), // 2% of screen height

        // "Enter a New Address" TextField
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F5F7),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            children: [
              const Icon(Icons.place, color: Color(0xFF7A869A)), // Icon color
              SizedBox(
                  width: screenWidth *
                      0.03), // Adjust spacing based on screen width
              Expanded(
                child: TextField(
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      _selectLocation(value); // Select the entered address
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter a new address",
                    hintStyle: GoogleFonts.dmSans(
                      fontSize: screenWidth * 0.04,
                      color: const Color(
                          0xFF7A869A), // Match hint text color to icon
                    ),
                    border: InputBorder.none,
                  ),
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFF7A869A),
                  ), // User input text color
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Builds the container displaying the selected location
  Widget _buildSelectedLocationContainer(
      double screenHeight, double screenWidth) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: screenHeight * 0.08, // Adjust height to 8% of screen height
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F5F7),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _enteredAddress, // Display the selected address
                style: GoogleFonts.dmSans(
                  color: const Color(0xFF172B4D),
                  fontSize: screenWidth * 0.04,
                ),
              ),
              GestureDetector(
                onTap:
                    _resetScreen, // Reset the screen when tapping the close icon
                child: const Icon(Icons.close, color: Color(0xFF7A869A)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
