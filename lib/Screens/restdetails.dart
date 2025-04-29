// Importing the Flutter material design package
import 'package:flutter/material.dart';

// Entry point of the app
void main() {
  runApp(const MyApp());
}

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: Scaffold(
        body: BurgerBistroScreen(), // Displays the BurgerBistroScreen as the main content
      ),
    );
  }
}

// Stateful widget for the Burger Bistro screen
class BurgerBistroScreen extends StatefulWidget {
  @override
  _BurgerBistroScreenState createState() => _BurgerBistroScreenState();
}

class _BurgerBistroScreenState extends State<BurgerBistroScreen> {
  String selectedSize = '14"'; // Default pizza size
  bool isFavorite = false;     // Favorite icon toggle state

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Get screen dimensions

    return SafeArea( // Ensures UI doesn't overlap with system status bars
      child: SingleChildScrollView( // Allows scrolling for smaller screens
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section with back and favorite icons
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  child: Image.asset(
                    'assets/images/rest1.jpeg',
                    width: double.infinity,
                    height: size.height * 0.4, // 40% of screen height
                    fit: BoxFit.cover,
                  ),
                ),
                // Back button icon
                Positioned(
                  top: 10,
                  left: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
                // Favorite icon toggle
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Color(0xFF026A75) : Colors.grey,
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

            // Details section with name, location, rating, etc.
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Restaurant name
                  Text(
                    'Burger Bistro',
                    style: TextStyle(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Restaurant location with icon
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/images/mt3am.png',
                          width: size.width * 0.08,
                          height: size.width * 0.08,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Text(
                        'Rose Garden',
                        style: TextStyle(
                          fontSize: size.width * 0.035,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),

                  // Rating, delivery and time icons with text
                  Row(
                    children: [
                      Icon(Icons.star_border_outlined, size: size.width * 0.06, color: Color(0xFF026A75)),
                      SizedBox(width: size.width * 0.02),
                      Text('4.7'),
                      SizedBox(width: size.width * 0.04),
                      Icon(Icons.local_shipping, size: size.width * 0.06, color: Color(0xFF026A75)),
                      SizedBox(width: size.width * 0.02),
                      Text('Free'),
                      SizedBox(width: size.width * 0.04),
                      Icon(Icons.access_time, size: size.width * 0.06, color: Color(0xFF026A75)),
                      SizedBox(width: size.width * 0.02),
                      Text('20 min'),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),

                  // Description
                  Text(
                    'Maecenas sed diam eget risus varius blandit sit amet non magna...',
                    style: TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
                  ),
                  SizedBox(height: size.height * 0.02),

                  // Pizza size selection
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('SIZE:', style: TextStyle(fontSize: size.width * 0.045, color: Colors.grey)),
                      SizedBox(width: size.width * 0.04),
                      sizeButton('10"'),
                      SizedBox(width: size.width * 0.02),
                      sizeButton('14"'),
                      SizedBox(width: size.width * 0.02),
                      sizeButton('16"'),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),

                  // Ingredients title
                  Text('INGREDIENTS', style: TextStyle(fontSize: size.width * 0.045)),
                  SizedBox(height: size.height * 0.02),

                  // Ingredients icons grid
                  Wrap(
                    spacing: size.width * 0.07,
                    runSpacing: size.width * 0.07,
                    children: [
                      ingredientIcon('Salt'),
                      ingredientIcon('Chicken'),
                      ingredientIcon('Onion', allergy: true),
                      ingredientIcon('Garlic'),
                      ingredientIcon('Peppers', allergy: true),
                      ingredientIcon('Ginger'),
                      ingredientIcon('Broccoli'),
                      ingredientIcon('Orange'),
                      ingredientIcon('Walnut'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for size selection buttons
  Widget sizeButton(String size) {
    bool isSelected = size == selectedSize;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF026A75) : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: isSelected ? Color(0xFF026A75) : Colors.grey),
        ),
        child: Text(
          size,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  // Widget for ingredient icons
  Widget ingredientIcon(String name, {bool allergy = false}) {
    IconData iconData;

    // Choose icon based on ingredient name
    switch (name.toLowerCase()) {
      case 'salt':
        iconData = Icons.spa;
        break;
      case 'chicken':
        iconData = Icons.egg_alt;
        break;
      case 'onion':
        iconData = Icons.circle;
        break;
      case 'garlic':
        iconData = Icons.energy_savings_leaf;
        break;
      case 'peppers':
        iconData = Icons.local_fire_department;
        break;
      case 'ginger':
        iconData = Icons.grass;
        break;
      case 'broccoli':
        iconData = Icons.eco;
        break;
      case 'orange':
        iconData = Icons.brightness_1;
        break;
      case 'walnut':
        iconData = Icons.rice_bowl;
        break;
      default:
        iconData = Icons.help_outline;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Color.fromARGB(247, 246, 224, 216),
          child: Icon(
            iconData,
            color: allergy ? Color(0xFF026A75) : Color(0xFF026A75),
          ),
        ),
        SizedBox(height: 4),
        Text(
          name,
          style: TextStyle(
            fontSize: 12,
            color: allergy ? Color(0xFF026A75) : Colors.black,
          ),
        ),
      ],
    );
  }
}
