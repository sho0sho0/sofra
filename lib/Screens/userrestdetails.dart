import 'package:flutter/material.dart';

// Entry point of the app
void main() {
  runApp(MyApp()); // Runs the app and loads MyApp widget
}

// Main app widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner
      home: FoodDetailsPage(), // Set the home screen
    );
  }
}

// A StatefulWidget to handle dynamic UI updates
class FoodDetailsPage extends StatefulWidget {
  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState();
}

// State class for FoodDetailsPage
class _FoodDetailsPageState extends State<FoodDetailsPage> {
  final PageController _pageController = PageController(viewportFraction: 0.6); // Controller for image slider
  int _currentIndex = 0; // Track current image index in slider

  // List of image paths for the food slider
  final List<String> imagePaths = [
    'assets/images/dish1.png',
    'assets/images/dish2.jpeg',
    'assets/images/dish3.jpeg',
    'assets/images/dish1.png',
  ];

  // List of ingredients with image path and name
  final List<Map<String, String>> ingredients = [
    {'image': 'assets/images/procli.png', 'name': 'Broccoli'},
    {'image': 'assets/images/pepperred.png', 'name': 'Chili'},
    {'image': 'assets/images/corn.png', 'name': 'Corn'},
    {'image': 'assets/images/carrots.png', 'name': 'Carrot'},
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Get screen width
    double screenHeight = MediaQuery.of(context).size.height; // Get screen height

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Image slider positioned at the top
          Positioned(
            top: screenHeight * 0.1,
            left: 0,
            right: 0,
            child: buildImageSlider(screenHeight, screenWidth), // Call image slider widget
          ),

          // Content section with food details
          Positioned(
            top: screenHeight * 0.30,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Food name
                  Text(
                    'Fried Shrimp',
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF026A75),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  
                  // Description text
                  Text(
                    'This is my kind of breakfast egg sandwich',
                    style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.grey),
                  ),
                  Text(
                    'and it takes under 5 minutes to make.',
                    style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.grey),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Info icons (rating, time, calories)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildIconText(
                        icon: Icons.star_border_outlined,
                        text: '4.8 (163)',
                        iconColor: Colors.grey,
                        fontSize: screenWidth * 0.04,
                      ),
                      _buildIconText(
                        icon: Icons.timer_outlined,
                        text: '20 min',
                        iconColor: Colors.grey,
                        fontSize: screenWidth * 0.04,
                      ),
                      _buildIconText(
                        icon: Icons.local_fire_department_outlined,
                        text: '150 kcal',
                        iconColor: Colors.grey,
                        fontSize: screenWidth * 0.04,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Ingredients header with item count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ingredients',
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF026A75),
                        ),
                      ),
                      Text(
                        '${ingredients.length} items',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF026A75),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Ingredients horizontal list
                  SizedBox(
                    height: screenHeight * 0.15,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: ingredients.map((ingredient) {
                        return _buildIngredientItem(
                          ingredient['image']!,
                          ingredient['name']!,
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Price section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(fontSize: screenWidth * 0.03, color: Colors.black54),
                      ),
                      Text(
                        '\$29.00',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF026A75),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Decorative circle background at bottom
          Positioned(
            bottom: -screenHeight * 0.65625,
            right: -screenWidth * 0.197222,
            child: SizedBox(
              width: screenWidth * 1.3888,
              height: screenWidth * 1.3888,
              child: CircleAvatar(
                backgroundColor: Color(0xfff026A75),
              ),
            ),
          ),

          // Floating add button at the bottom center
          Positioned(
            top: screenHeight * 0.90625,
            right: screenWidth * 0.01388,
            left: screenWidth * 0.01388,
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: screenWidth * 0.08333,
                ),
                onPressed: () {}, // Add to cart or perform an action
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Builds the animated image slider
  Widget buildImageSlider(double screenHeight, double screenWidth) {
    return SizedBox(
      height: screenHeight * 0.25,
      child: PageView.builder(
        controller: _pageController,
        itemCount: imagePaths.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index; // Update selected image index
          });
        },
        itemBuilder: (context, index) {
          double scale = _currentIndex == index ? 1.0 : 0.8; // Scale for selected image
          return TweenAnimationBuilder(
            tween: Tween<double>(begin: scale, end: scale),
            duration: Duration(milliseconds: 300),
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: screenWidth * 0.2,
                      backgroundImage: AssetImage(imagePaths[index]),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Builds icon + text row for details (rating, time, etc.)
  Widget _buildIconText({
    required IconData icon,
    required String text,
    required Color iconColor,
    required double fontSize,
  }) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: fontSize),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(fontSize: fontSize, color: Colors.grey),
        ),
      ],
    );
  }

  // Builds individual ingredient item
  Widget _buildIngredientItem(String imagePath, String name) {
    return Container(
      width: 70,
      height: 150,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 247, 236),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 60, height: 60), // Ingredient image
          SizedBox(height: 10),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), // Ingredient name
          ),
        ],
      ),
    );
  }
}
