// Importing Flutter's Material Design library
import 'package:flutter/material.dart';
// Importing the main.dart file (assuming it has shared widgets or resources)
import 'package:sofra/Screens/main.dart';

// The main function - entry point of the Flutter app
void main() {
  runApp(const MyApp()); // Launching the app with MyApp as the root widget
}

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disables the debug banner
      home: FoodMenuScreen(), // Sets the home screen to FoodMenuScreen
    );
  }
}

// Main screen widget showing food items
class FoodMenuScreen extends StatelessWidget {
  // Sample list of dishes, each dish is a map with details
  final List<Map<String, dynamic>> dishes = [
    {
      "name": "Fried Shrimp",
      "image": 'assets/images/dish1.png',
      "rating": 4.8,
      "reviews": 163,
      "time": "20 min",
      "price": 29.00,
    },
    // Many repeated dishes here (for demonstration)
    {
      "name": "Grilled Chicken",
      "image": 'assets/images/dish1.png',
      "rating": 4.6,
      "reviews": 120,
      "time": "25 min",
      "price": 25.00,
    },
    // ...
    {
      "name": "BBQ Ribs",
      "image": 'assets/images/dish1.png',
      "rating": 4.4,
      "reviews": 110,
      "time": "35 min",
      "price": 32.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Getting screen width for responsive UI design
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomizedAppBar( // Custom app bar
        title: 'Popular Products',
        isThereLeadingIcon: true,
      ),
      body: SafeArea( // Ensures content doesn't go under the status bar
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Categories row with title and "All" + arrow
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories", style: TextStyle(fontSize: screenWidth * 0.05)),
                  Row(
                    children: [
                      Text("All", style: TextStyle(fontSize: screenWidth * 0.035, color: Colors.grey)),
                      Icon(Icons.arrow_forward, size: screenWidth * 0.03, color: Colors.orange),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.03),

              // Horizontal list of food categories
              SizedBox(
                height: screenWidth * 0.11,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryItem(context, "Burger", Icons.lunch_dining),
                    _buildCategoryItem(context, "Pizza", Icons.local_pizza),
                    _buildCategoryItem(context, "Pasta", Icons.dinner_dining),
                    _buildCategoryItem(context, "Drinks", Icons.local_drink),
                    // Repeated for demonstration
                  ],
                ),
              ),
              SizedBox(height: screenWidth * 0.05),

              // "New Dishes" section header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("New Dishes", style: TextStyle(fontSize: screenWidth * 0.05)),
                  Row(
                    children: [
                      Text("All", style: TextStyle(fontSize: screenWidth * 0.035, color: Colors.grey)),
                      Icon(Icons.arrow_forward, size: screenWidth * 0.03, color: Colors.orange),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.03),

              // Responsive grid for dish cards
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Show 3 columns for wide screens, 2 for narrow ones
                    final crossAxisCount = screenWidth > 600 ? 3 : 2;

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: screenWidth * 0.04,
                        mainAxisSpacing: screenWidth * 0.04,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: dishes.length,
                      itemBuilder: (context, index) {
                        final dish = dishes[index];
                        return _buildDishCard(
                          context,
                          name: dish["name"],
                          image: dish["image"],
                          rating: dish["rating"],
                          reviews: dish["reviews"],
                          time: dish["time"],
                          price: dish["price"],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom navigation bar with four options
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF026A75),
        unselectedItemColor: Colors.grey,
        currentIndex: 2, // The selected tab index
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shopping Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Profile'),
        ],
        onTap: (index) {
          // Handle tap on bottom nav items
        },
      ),
    );
  }

  // Reusable widget to display category tags like "Burger", "Pizza"
  Widget _buildCategoryItem(BuildContext context, String label, IconData icon) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(right: screenWidth * 0.03),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenWidth * 0.02),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 246, 237),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: screenWidth * 0.045, color: Colors.orange),
          SizedBox(width: screenWidth * 0.02),
          Text(label, style: TextStyle(fontSize: screenWidth * 0.035)),
        ],
      ),
    );
  }

  // Reusable widget to display each food dish card
  Widget _buildDishCard(
    BuildContext context, {
    required String name,
    required String image,
    required double rating,
    required int reviews,
    required String time,
    required double price,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 246, 237),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dish image
          Center(
            child: ClipOval(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: screenWidth * 0.3,
                height: screenWidth * 0.3,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dish name
                Center(child: Text(name, style: TextStyle(fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold))),
                SizedBox(height: screenWidth * 0.03),
                
                // Rating, reviews, and time
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star_border_outlined, size: screenWidth * 0.035, color: Colors.amber),
                      SizedBox(width: screenWidth * 0.01),
                      Text("$rating ($reviews)", style: TextStyle(fontSize: screenWidth * 0.03, color: Colors.grey)),
                      SizedBox(width: screenWidth * 0.03),
                      Icon(Icons.timer_outlined, size: screenWidth * 0.035, color: Colors.grey),
                      SizedBox(width: screenWidth * 0.01),
                      Text(time, style: TextStyle(fontSize: screenWidth * 0.03, color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(height: screenWidth * 0.03),

                // Price
                Center(
                  child: Text(
                    "\$$price",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF026A75),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom app bar widget with optional back icon
class CustomizedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isThereLeadingIcon;

  const CustomizedAppBar({
    super.key,
    required this.title,
    required this.isThereLeadingIcon,
  });

  // Defines the app bar height
  @override
  Size get preferredSize {
    double appBarHeight = 90;
    return Size.fromHeight(appBarHeight);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: isThereLeadingIcon
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      title: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.03),
        child: Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
