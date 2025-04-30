import 'package:flutter/material.dart';
import 'package:sofra_app/components/customized_appbar.dart';
import 'package:sofra_app/main.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    // Get screen height and width using MediaQuery to make the UI responsive
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffffefefe),
      body: Stack(
        children: [
          // Pizza image at the top of the screen with rounded corners and shadow
          Positioned(
            top: screenHeight * 0.0776,
            right: screenWidth * 0.05,
            left: screenWidth * 0.05,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/pizza.png',
                width: screenWidth - 32,
                height: 148,
              ),
            ),
          ),

          // Custom AppBar positioned at the top with transparent background
          Positioned(
            top: screenHeight * 0.01562,
            right: screenWidth * 0.04444,
            left: screenWidth * 0.04444,
            child: const CustomizedAppBar(
              appbarColor: Colors.transparent,
              title: '',
              isThereLeadingIcon: true,
              isThereTitle: false,
              iconBackgroundColor: Colors.white,
            ),
          ),

          // Pizza Hut logo in the center of the screen inside a circular avatar
          Positioned(
            top: screenHeight * 0.2256,
            right: screenWidth * 0.004777,
            left: screenWidth * 0.004777,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xfffffc529)
                            .withOpacity(0.3), // Shadow color
                        blurRadius: 10, // Spread of the shadow
                        spreadRadius: 2, // Intensity of the shadow
                        offset: const Offset(4, 4), // Position of the shadow
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: const Color(0xfffffc529),
                    radius: 30,
                    child: Image.asset(
                      'assets/pizzaHut.png',
                      width: screenWidth * 0.127,
                      height: screenHeight * 0.0723,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Circle Avatar with check icon indicating order status
          Positioned(
            top: screenHeight * 0.30,
            right: screenWidth * 0.41156,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 8,
              child: CircleAvatar(
                backgroundColor: const Color(0xfff029094),
                radius: 5,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: screenWidth * 0.01944,
                ),
              ),
            ),
          ),

          // Restaurant name at the bottom of the image
          Positioned(
            bottom: screenHeight * 0.6093,
            right: screenWidth * 0.002777,
            left: screenWidth * 0.002777,
            child: Center(
              child: Text(
                'Pizza Hut',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05555),
              ),
            ),
          ),

          // Address below the restaurant name
          Positioned(
            bottom: screenHeight * 0.5906,
            right: screenWidth * 0.002777,
            left: screenWidth * 0.002777,
            child: Center(
              child: Text(
                '4102  Pretty View Lanenda',
                style: TextStyle(
                    color: const Color(0xfff9796a1),
                    fontSize: screenWidth * 0.02777),
              ),
            ),
          ),

          // Order status (Order Delivered) with a circular icon
          Positioned(
            bottom: screenHeight * 0.55,
            left: screenWidth * 0.002777,
            right: screenWidth * 0.002777,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: const Color(0xfff53d776),
                  size: screenWidth * 0.013888,
                ),
                SizedBox(
                  width: screenWidth * 0.013888,
                ),
                Text(
                  'Order Delivered',
                  style: TextStyle(
                    color: const Color(0xfff53d776),
                    fontSize: screenWidth * 0.030555,
                  ),
                ),
              ],
            ),
          ),

          // Request for rating delivery service
          Positioned(
            bottom: screenHeight * 0.4875,
            right: screenWidth * 0.002777,
            left: screenWidth * 0.002777,
            child: Center(
                child: Text(
              'Please Rate Delivery Service',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: screenWidth * 0.0416),
            )),
          ),

          // Pre-selected "Good" rating label
          Positioned(
            bottom: screenHeight * 0.425,
            right: screenWidth * 0.002777,
            left: screenWidth * 0.002777,
            child: Center(
              child: Text(
                'Good',
                style: TextStyle(
                    color: const Color(0xffffe724c),
                    fontSize: screenWidth * 0.0555),
              ),
            ),
          ),

          // Rating stars for the user to select (5 stars)
          Positioned(
            bottom: screenHeight * 0.36718,
            left: screenWidth * 0.002777,
            right: screenWidth * 0.002777,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingStar(),
                RatingStar(),
                RatingStar(),
                RatingStar(),
                RatingStar(),
              ],
            ),
          ),

          // Review text field for the user to write their feedback
          Positioned(
            bottom: screenHeight * 0.15625,
            right: screenWidth * 0.069444,
            left: screenWidth * 0.069444,
            child: Center(
              child: Container(
                height: screenHeight * 0.190625,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFFEEEEEE),
                  ),
                ),
                child: TextField(
                  cursorColor: const Color(0xFFFFC529),
                  cursorHeight: screenHeight * 0.0234,
                  decoration: InputDecoration(
                    hintText: 'Write review',
                    hintStyle: TextStyle(
                        color: Colors.grey, fontSize: screenWidth * 0.0333),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.02777),
                  ),
                ),
              ),
            ),
          ),

          // Submit button at the bottom to send the review
          Positioned(
            bottom: screenHeight * 0.046875,
            left: screenWidth * 0.069444,
            right: screenWidth * 0.069444,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: const Color(0xFFF9FAFA),
                elevation: 0,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.0203,
                ),
              ),
              child: Text(
                'Submit',
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

// Custom RatingStar widget for displaying individual star rating
class RatingStar extends StatefulWidget {
  const RatingStar({super.key});

  @override
  _RatingStarState createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    // Get screen width to adjust star size dynamically
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected; // Toggle star selection on tap
        });
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFFFC529).withOpacity(0.13),
                    blurRadius: 15,
                    offset: const Offset(0.1, 0),
                  ),
                ]
              : [],
        ),
        child: Icon(
          isSelected ? Icons.star : Icons.star_border,
          color: isSelected ? const Color(0xFFFFC529) : const Color(0xFFFFC529),
          size: screenWidth * 0.09166, // Adjust star size based on screen width
          shadows: isSelected
              ? [
                  Shadow(
                    color: const Color(0xFFFFC529).withOpacity(0.5),
                    blurRadius: 10,
                  ),
                ]
              : null,
        ),
      ),
    );
  }
}
