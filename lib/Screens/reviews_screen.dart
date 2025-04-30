import 'package:flutter/material.dart';
import 'package:sofra_app/components/customized_appbar.dart';
import 'package:sofra_app/main.dart';

// ReviewsScreen displays a page showing restaurant reviews and rating breakdown
class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive sizing
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomizedAppBar(
        title: 'Reviews', // Title of the app bar
        isThereLeadingIcon: true, // Whether there's a back button
        isThereTitle: true, // Whether to show the title
        appbarColor: Colors.transparent, // Transparent background
        iconBackgroundColor: Colors.transparent, // Transparent icon background
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
            screenWidth * 0.0444), // General padding for the page
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overall rating summary container
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.0444,
                vertical: screenHeight * 0.0125,
              ),
              decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(screenWidth * 0.0444),
              ),
              child: Column(
                children: [
                  // Average Rating Score
                  Text(
                    '4.8',
                    style: TextStyle(
                      fontSize: screenWidth * 0.1111,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.0125),
                  // Star icons to visualize rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: screenWidth * 0.0666,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.0125),
                  // Total number of reviews
                  const Text(
                    '(7 Reviews)',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  // Individual rating bars (5-star, 4-star, etc.)
                  _buildRatingBar(5, 0.9, screenWidth, screenHeight),
                  _buildRatingBar(4, 0.7, screenWidth, screenHeight),
                  _buildRatingBar(3, 0.4, screenWidth, screenHeight),
                  _buildRatingBar(2, 0.2, screenWidth, screenHeight),
                  _buildRatingBar(1, 0.05, screenWidth, screenHeight),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.025),
            // Filter and arrange reviews
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.01666,
                      vertical: screenHeight * 0.009375,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffF2F2F2)),
                      borderRadius: BorderRadius.circular(screenWidth * 0.069),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Star '),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: screenWidth * 0.0666,
                        ),
                        Icon(Icons.arrow_drop_down), // Dropdown icon
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff332C45),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.069),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.009375,
                      ),
                    ),
                    onPressed: () {}, // Action to arrange/sort reviews
                    icon: const Icon(Icons.swap_vert, color: Colors.white),
                    label: const Text('Arrange',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.0375),
            // List of review items
            _buildReviewItem(screenWidth, screenHeight),
            _buildReviewItem(screenWidth, screenHeight),
            _buildReviewItem(screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }

  // Helper widget to build each rating bar (stars count and progress indicator)
  Widget _buildRatingBar(
      int stars, double percent, double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.00625),
      child: Row(
        children: [
          Text('$stars'), // Number of stars
          SizedBox(width: screenWidth * 0.0111),
          Icon(
            Icons.star,
            size: screenWidth * 0.0444,
            color: Colors.amber,
          ),
          SizedBox(width: screenWidth * 0.0222),
          Expanded(
            child: LinearProgressIndicator(
              value: percent, // Percentage of reviews with this star rating
              backgroundColor: Colors.grey.shade300,
              color: primaryColor, // Main color for the filled progress
              minHeight: screenHeight * 0.0125,
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget to build a single review item
  Widget _buildReviewItem(double screenWidth, double screenHeight) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User profile picture (placeholder CircleAvatar)
            const CircleAvatar(
              backgroundColor: Colors.redAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: screenWidth * 0.0333),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Username and review date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Alenzo Endera',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '03/09/2023',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: screenWidth * 0.0333,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.00625),
                  // Review stars
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        size: screenWidth * 0.0444,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.0125),
                  // Review text content
                  const Text(
                    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Divider between reviews
        Divider(height: screenHeight * 0.05),
      ],
    );
  }
}
