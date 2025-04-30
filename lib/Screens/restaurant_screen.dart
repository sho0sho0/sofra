import 'package:flutter/material.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  // Boolean to track if the restaurant is favorited
  bool isFavorite = false;

  @override
  Size get preferredSize {
    // Define app bar height, adjustable based on screen height
    double appBarHeight = 90;
    return Size.fromHeight(appBarHeight);
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve screen height and width to make the UI responsive
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // Safe Area top inset (status bar height) for adjusting padding from the top
    double safeTopPadding = MediaQuery.of(context).padding.top;

    // Padding and icon size relative to screen width
    double appBarPadding = screenWidth * 0.03; // 3% of screen width for padding
    double iconSize = screenWidth * 0.06; // Icon size relative to screen width

    // Total top padding considering safe area and app bar padding
    double topPadding = safeTopPadding + appBarPadding;

    return Scaffold(
      body: Stack(
        children: [
          // Background image for the restaurant screen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/restaurant.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // App bar customization with padding and icons
          PreferredSize(
            preferredSize: Size.fromHeight(preferredSize.height),
            child: Container(
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.only(
                    top: topPadding, left: appBarPadding, right: appBarPadding),
                child: Stack(
                  children: [
                    // Back button
                    Positioned(
                      top: screenHeight * 0.015,
                      left: screenWidth * 0.02,
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.6),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: const Color(0xfff156778),
                            size: iconSize,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    // Additional icon (image in this case)
                    Positioned(
                      top: screenHeight * 0.015,
                      right: screenWidth * 0.02,
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.6),
                        child: IconButton(
                          icon: SizedBox(
                            width: screenWidth * 0.05,
                            height: screenWidth * 0.05,
                            child: Image.asset(
                              'assets/Vector.png', // Path to your vector image
                              fit: BoxFit.contain,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    // Favorite icon button (toggle state)
                    Positioned(
                      top: screenHeight * 0.015,
                      right: screenWidth * 0.18,
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.6),
                        child: IconButton(
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border, // Toggle icon
                            color: isFavorite
                                ? const Color(0xfffed4c5c)
                                : const Color(0xfffed4c5c),
                            size: iconSize, // Toggle color
                          ),
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite; // Toggle state
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Main content of the restaurant screen
          Positioned(
            bottom: screenHeight * 0.109,
            left: screenWidth * 0.01,
            right: screenWidth * 0.01,
            child: Center(
              child: Container(
                width: screenWidth - (screenWidth * 0.125),
                height: screenHeight * 0.3125,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    // 'OPEN' tag styling
                    Positioned(
                      right: 0,
                      top: screenHeight * 0.03125,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffffff9e5),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: screenWidth * 0.0278,
                            top: screenHeight * 0.0125,
                            bottom: screenHeight * 0.0125,
                            right: screenWidth * 0.0444,
                          ),
                          child: Text(
                            'OPEN',
                            style: TextStyle(
                              color: const Color(0xffff98600),
                              fontWeight: FontWeight.w600,
                              fontSize: screenWidth * 0.0278,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Restaurant name and description
                    Positioned(
                      left: screenWidth * 0.0555,
                      top: screenHeight * 0.03125,
                      child: Text(
                        'Home Made Eat . Food . 2+',
                        style: TextStyle(
                          color: const Color(0xfff156778),
                          fontSize: screenWidth * 0.025,
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenWidth * 0.0555,
                      top: screenHeight * 0.070,
                      child: Text(
                        'Akla Hanya',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenWidth * 0.0555,
                      top: screenHeight * 0.109,
                      child: Text(
                        '360 Stillwater Rd. Palm City, FL 34990',
                        style: TextStyle(
                          color: const Color(
                            0xfff50555c,
                          ),
                          fontSize: screenWidth * 0.036,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    // Ratings and discount info
                    Positioned(
                      left: screenWidth * 0.0555,
                      top: screenHeight * 0.156,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: screenWidth * 0.0416,
                            color: const Color(0xffff98600),
                          ),
                          SizedBox(
                            width: screenWidth * 0.00833,
                          ),
                          Text(
                            '4.7',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.0305,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.00833,
                          ),
                          Text(
                            '(2.7k)',
                            style: TextStyle(
                              fontSize: screenWidth * 0.0305,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.0555,
                          ),
                          Icon(
                            Icons.discount,
                            size: screenWidth * 0.0416,
                            color: const Color(0xfff026a75),
                          ),
                          SizedBox(
                            width: screenWidth * 0.00833,
                          ),
                          Text(
                            '-58%',
                            style: TextStyle(
                              color: const Color(0xfff026a75),
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.03055,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.00833,
                          ),
                          Text(
                            '(6 pax available)',
                            style: TextStyle(
                              fontSize: screenWidth * 0.0305,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Order button
                    Positioned(
                      left: screenWidth * 0.01388,
                      right: screenWidth * 0.01388,
                      top: screenHeight * 0.203,
                      child: Center(
                        child: SizedBox(
                          width: screenWidth - (screenWidth * 0.25),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF026A75),
                              foregroundColor: const Color(0xFFF9FAFA),
                              elevation: 0,
                            ),
                            child: const Text('Order Now'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // View more details button
          Positioned(
            top: screenHeight * 0.9,
            right: screenWidth * 0.01388,
            left: screenWidth * 0.01388,
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'View More Details  ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.0277,
                      ),
                    ),
                    Icon(
                      Icons.expand_more,
                      color: Colors.white,
                      size: screenWidth * 0.0416,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
