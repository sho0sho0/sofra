import 'dart:async'; // Importing to use Timer for auto-sliding
import 'package:flutter/material.dart'; // Flutter UI framework

// Entry point of the app
void main() {
  runApp(MyApp());
}

// Root widget of the app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: RestaurantScreen(), // Sets the home screen
    );
  }
}

// Main screen for the restaurant UI
class RestaurantScreen extends StatefulWidget {
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final PageController _pageController = PageController(); // Controller for the image slider
  int _currentPage = 0; // Current index of the slider
  Timer? _sliderTimer; // Timer for auto-sliding
  final List<String> _imagePaths = [ // List of image paths used in the slider
    'assets/images/rest1.jpeg',
    'assets/images/rest2.jpeg',
    'assets/images/food10.jpeg',
    'assets/images/food1.png',
    'assets/images/food2.png',
    'assets/images/food3.png',
  ];

  @override
  void initState() {
    super.initState();
    _startSliderAutoPlay(); // Starts the auto-play of the slider
  }

  @override
  void dispose() {
    _pageController.dispose(); // Disposes the controller
    _sliderTimer?.cancel(); // Cancels the timer
    super.dispose();
  }

  // Function to start the auto-slide of the images
  void _startSliderAutoPlay() {
    _sliderTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _currentPage + 1;

        // Loop to the first page if end is reached
        if (nextPage >= _imagePaths.length) {
          nextPage = 0;
        }

        // Animate to the next image
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );

        setState(() {
          _currentPage = nextPage; // Update page index
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Get screen width for responsiveness

    return Scaffold(
      body: SingleChildScrollView( // Makes the whole screen scrollable
        child: Column(
          children: [
            // Image Slider Section
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 400,
                child: Stack(
                  children: [
                    // Main image slider
                    PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: _imagePaths.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          _imagePaths[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      },
                    ),
                    // Slider Dots Indicator
                    Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_imagePaths.length, (index) {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: _currentPage == index ? 12 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? Colors.white
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          );
                        }),
                      ),
                    ),
                    // Back button
                    Positioned(
                      top: 40,
                      left: 16,
                      child: FloatingActionButton(
                        mini: true,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          // Handle back action
                        },
                      ),
                    ),
                    // Menu button
                    Positioned(
                      top: 40,
                      right: 16,
                      child: FloatingActionButton(
                        mini: true,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.more_horiz, color: Colors.black),
                        onPressed: () {
                          // Handle menu action
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Restaurant Info Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ratings Row
                  Row(
                    children: [
                      Icon(Icons.star_border_outlined,
                          color: Color(0xFF026A75), size: 30),
                      SizedBox(width: 4),
                      Text("4.7"),
                      SizedBox(width: screenWidth * 0.15),
                      Icon(Icons.delivery_dining_outlined,
                          color: Color(0xFF026A75), size: 30),
                      SizedBox(width: 4),
                      Text("Free"),
                      SizedBox(width: screenWidth * 0.15),
                      Icon(Icons.access_time,
                          color: Color(0xFF026A75), size: 30),
                      SizedBox(width: 4),
                      Text("20 min"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Restaurant name
                  Text(
                    "Spicy Restaurant",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Restaurant description
                  Text(
                    "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Food Categories Chips
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryChip(label: "Burger"),
                    CategoryChip(label: "Sandwich"),
                    CategoryChip(label: "Pizza"),
                    CategoryChip(label: "Snacks"),
                    CategoryChip(label: "Juice"),
                    CategoryChip(label: "Salads"),
                    CategoryChip(label: "Fishs"),
                    CategoryChip(label: "Snacks"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Menu Items Grid Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Burger (10)",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  MenuItemsGrid(), // Displays menu items
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Chip for food categories
class CategoryChip extends StatefulWidget {
  final String label;

  const CategoryChip({required this.label});

  @override
  _CategoryChipState createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected; // Toggle selection
          });
        },
        child: Chip(
          label: Text(widget.label),
          backgroundColor: _isSelected
              ? Color(0xFF026A75)
              : Colors.white,
          labelStyle: TextStyle(
            color: _isSelected ? Colors.white : Colors.black,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
              color: _isSelected
                  ? Color(0xFF026A75)
                  : Color.fromARGB(255, 216, 215, 215),
              width: 1.0,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
      ),
    );
  }
}

// Widget for individual menu item
class MenuItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;

  const MenuItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              height: 110,
              width: 130,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                price,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 15, height: 4),
              IconButton(
                onPressed: () {}, // Action for adding item
                icon: Icon(Icons.add_circle, color: Color(0xFF026A75)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget that holds a grid of menu items
class MenuItemsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        // Repeated menu items
        MenuItem(
          imageUrl: 'assets/images/rest1.jpeg',
          title: "Burger Ferguson",
          subtitle: "Spicy Restaurant",
          price: "\$40",
        ),
        MenuItem(
          imageUrl: 'assets/images/rest2.jpeg',
          title: "Rockin' Burgers",
          subtitle: "Cafecafachino",
          price: "\$40",
        ),
        // ... (more repeated items)
        // You can replace or loop these items from a list for scalability
      ],
    );
  }
}
