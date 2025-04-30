import 'package:flutter/material.dart';
import 'package:sofra_app/main.dart'; // Importing main.dart for accessing global variables like primaryColor

// Stateful widget for the Shop screen
class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  // List to track the favorite state of horizontal "For You" items
  List<bool> isFavoriteForYouList = [
    false,
    false,
    false
  ]; // Initial favorite status for 3 sample items

  // Background color of the screen
  final Color mainBackgroundColor = Colors.grey.shade100;

  @override
  Widget build(BuildContext context) {
    // Retrieve screen dimensions for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: mainBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            // Header section with image, back button, and logo
            Stack(
              children: [
                // Background color container to reserve height
                Container(
                  color: mainBackgroundColor,
                  height: screenHeight * 0.3703,
                ),
                // Main banner image
                Positioned(
                  top: 0,
                  child: Image.asset(
                    'assets/1.png',
                    height: screenHeight * 0.3125,
                    fit: BoxFit.cover,
                  ),
                ),
                // Back button in a white circular container
                Positioned(
                  top: screenHeight * 0.015,
                  left: screenWidth * 0.02,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: const Color(0xfff156778),
                        size: screenWidth * 0.03333,
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Go back to previous screen
                      },
                    ),
                  ),
                ),
                // White circular logo/image (e.g. shop profile)
                Positioned(
                  bottom: 0,
                  left: screenWidth * 0.05555,
                  child: CircleAvatar(
                    radius: screenWidth * 0.11111,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/2.png',
                        fit: BoxFit.cover,
                        width: screenWidth * 0.2222,
                        height: screenHeight * 0.125,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Shop information section
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.025),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shop name and metadata
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Akla Hanya", // Shop name
                            style: TextStyle(
                                fontSize: screenWidth * 0.06111,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: screenHeight * 0.00625),
                          Text("NYC, Broadway ave 79"), // Address
                          SizedBox(height: screenHeight * 0.00625),
                          Text(
                            "Opening", // Status
                            style: TextStyle(
                                fontSize: screenWidth * 0.0333,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: screenHeight * 0.00625),
                          // Rating and orders row
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.amber,
                                  size: screenWidth * 0.04444),
                              SizedBox(width: screenWidth * 0.01111),
                              Text("4.8 (1.2k)"), // Rating
                              SizedBox(width: screenWidth * 0.02777),
                              Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.grey,
                                size: screenWidth * 0.04166,
                              ),
                              Text(" 99+ orders"), // Orders info
                            ],
                          ),
                        ],
                      ),
                      Spacer(), // Push right-side content to end
                      // Right-side action icons
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // TODO: Add favorite logic for shop
                            },
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01562),
                          Icon(Icons.info_outline,
                              color: Colors.black, size: screenWidth * 0.05),
                          SizedBox(height: screenHeight * 0.01562),
                          GestureDetector(
                            onTap: () {
                              // TODO: Handle reviews tap
                            },
                            child: Text(
                              "Reviews",
                              style: TextStyle(
                                fontSize: screenWidth * 0.03333,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01562),

                  // Filter tags section
                  Row(
                    children: [
                      _buildTag("All Meals", true, screenHeight, screenWidth),
                      _buildTag("Burger", false, screenHeight, screenWidth),
                      _buildTag("Rice", false, screenHeight, screenWidth),
                      _buildTag("Taco", false, screenHeight, screenWidth),
                    ],
                  )
                ],
              ),
            ),

            // For You section header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04444),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("For You",
                      style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.0125),

            // Horizontal scrollable menu cards (For You)
            _buildHorizontalList([
              _buildMenuCard("Burger", 0, screenHeight, screenWidth),
              _buildMenuCard("Pizza Hut", 1, screenHeight, screenWidth)
            ], screenHeight, screenWidth),

            // Recommend section header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0444),
              child: Text("Recommend",
                  style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: screenHeight * 0.0125),

            // Vertical list items
            _buildVerticalMenu("Hamburger", screenHeight, screenWidth),
            _buildVerticalMenu("Hamburger", screenHeight, screenWidth),
            _buildVerticalMenu("Hamburger", screenHeight, screenWidth),
          ],
        ),
      ),
    );
  }

  // Widget for filter tags like "All Meals", "Burger", etc.
  Widget _buildTag(
      String label, bool selected, double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.only(right: screenWidth * 0.01111),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.0194, vertical: screenHeight * 0.00625),
      decoration: BoxDecoration(
        color: selected ? primaryColor : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(screenWidth * 0.0555),
      ),
      child: Text(label,
          style: TextStyle(color: selected ? Colors.white : Colors.black)),
    );
  }

  // Widget for each horizontal "For You" menu card
  Widget _buildMenuCard(
      String title, int index, double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.3055,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.0111),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Image with rounded top corners
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenWidth * 0.044),
                    topRight: Radius.circular(screenWidth * 0.044),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenWidth * 0.044),
                    topRight: Radius.circular(screenWidth * 0.044),
                  ),
                  child: Image.asset(
                    'assets/3.png',
                    height: screenHeight * 0.4125,
                    width: screenWidth * 0.4166,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Discount label
              Positioned(
                top: screenHeight * 0.0125,
                left: screenWidth * 0.02222,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.016666,
                      vertical: screenHeight * 0.00625),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(screenWidth * 0.044),
                  ),
                  child: Text("4% off your order",
                      style: TextStyle(
                          fontSize: screenWidth * 0.01777,
                          color: Colors.white)),
                ),
              )
            ],
          ),
          SizedBox(height: screenHeight * 0.0093),
          Text(title),
          Row(
            children: [
              Icon(Icons.location_on,
                  size: screenWidth * 0.02888, color: Colors.grey),
              SizedBox(width: screenWidth * 0.00388),
              Text("1.5 km"),
              SizedBox(width: screenWidth * 0.00388),
              Icon(Icons.star, size: 14, color: Colors.amber),
              SizedBox(width: 5),
              Text("4.8 (1.2k)"),
              SizedBox(width: screenWidth * 0.01777),
              // Toggle favorite icon
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFavoriteForYouList[index] = !isFavoriteForYouList[index];
                  });
                },
                child: Icon(
                  isFavoriteForYouList[index]
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  color: Colors.orange,
                  size: screenWidth * 0.033,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Horizontal scroll container for "For You" section
  Widget _buildHorizontalList(
      List<Widget> items, double screenHeight, double screenWidth) {
    return Container(
      height: screenHeight * 0.328,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0444),
        children: items,
      ),
    );
  }

  // Vertical item layout for "Recommend" section
  Widget _buildVerticalMenu(
      String title, double screenHeight, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.0444, vertical: screenHeight * 0.0125),
      child: Container(
        color: mainBackgroundColor,
        child: Column(
          children: [
            Stack(
              children: [
                // Top image with rounded corners
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenWidth * 0.09),
                    topRight: Radius.circular(screenWidth * 0.09),
                  ),
                  child: Image.asset(
                    'assets/4.png',
                    height: screenHeight * 0.234,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Discount tag
                Positioned(
                  bottom: screenHeight * 0.0156,
                  right: screenWidth * 0.02777,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.01666,
                        vertical: screenHeight * 0.006),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(screenWidth * 0.0555),
                    ),
                    child: Text("4% off your order",
                        style: TextStyle(
                            fontSize: screenWidth * 0.02777,
                            color: Colors.white)),
                  ),
                ),
              ],
            ),
            // Menu title and icons
            ListTile(
              title: Text(title),
              subtitle: Row(
                children: [
                  Icon(Icons.location_on,
                      size: screenWidth * 0.03888, color: Colors.grey),
                  Text("1.5 km"),
                  SizedBox(width: 5),
                  Icon(Icons.star,
                      size: screenWidth * 0.03888, color: Colors.amber),
                  Text("4.8 (1.2k)"),
                ],
              ),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    // Optional: Add logic for vertical menu favorite
                  });
                },
                child: Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.grey,
                  size: screenWidth * 0.0555,
                ),
              ),
            ),
            Divider(color: Colors.grey.shade300),
          ],
        ),
      ),
    );
  }
}
