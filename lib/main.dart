import 'package:flutter/material.dart';

// Define a constant for the main background color of the app
const mainBackgroundColor = Colors.white;

void main() {
  runApp(MyApp()); // Start the app by running MyApp widget
}

// Root widget of the application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes debug banner
      home: FavoriteFoodScreen(), // Sets the main screen
    );
  }
}

// Stateful widget to manage food selection
class FavoriteFoodScreen extends StatefulWidget {
  @override
  _FavoriteFoodScreenState createState() => _FavoriteFoodScreenState();
}

class _FavoriteFoodScreenState extends State<FavoriteFoodScreen> {
  // List of image paths for food items
  final List<String> foodImages = [
    'assets/images/food1.png',
    'assets/images/food2.png',
    'assets/images/food3.png',
    'assets/images/food4.jpeg',
    'assets/images/food5.jpeg',
    'assets/images/food6.png',
    'assets/images/food7.jpeg',
    'assets/images/food8.jpeg',
    'assets/images/food9.jpeg',
    'assets/images/food10.jpeg',
  ];

  // Boolean list to track selected items
  late List<bool> selectedItems;

  @override
  void initState() {
    super.initState();
    // Initialize all items as not selected
    selectedItems = List.generate(foodImages.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: CustomizedAppBar(
        title: 'Like Your Favorite Food 😊',
        isThereLeadingIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.02,
        ),
        child: Column(
          children: [
            // Grid displaying food images
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(), // Bouncy scroll effect
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth > 600 ? 3 : 2, // Responsive columns
                  crossAxisSpacing: screenWidth * 0.04,
                  mainAxisSpacing: screenHeight * 0.02,
                ),
                itemCount: foodImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Toggle selection on tap
                      setState(() {
                        selectedItems[index] = !selectedItems[index];
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Image container
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.04),
                            image: DecorationImage(
                              image: AssetImage(foodImages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Overlay check icon when selected
                        if (selectedItems[index])
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.04),
                            ),
                            child: Icon(
                              Icons.check_circle,
                              color: Color(0xFF026A75),
                              size: screenWidth * 0.12,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // Action buttons: Skip and Next
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle skip button logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: const BorderSide(color: Color(0xFF026A75)), // Border style
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Color(0xFF026A75), fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle next button logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF026A75),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom AppBar Widget
class CustomizedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isThereLeadingIcon;

  const CustomizedAppBar({
    super.key,
    required this.title,
    required this.isThereLeadingIcon,
  });

  // Custom height for the AppBar
  @override
  Size get preferredSize => Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double safeTopPadding = MediaQuery.of(context).padding.top;

    // Padding and sizing values based on screen width
    double appBarPadding = screenWidth * 0.03;
    double iconSize = screenWidth * 0.06;
    double fontSize = screenWidth * 0.05;
    double textLeftPadding = screenWidth * 0.1;
    double topPadding = safeTopPadding + appBarPadding;

    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        left: appBarPadding,
        right: appBarPadding,
      ),
      child: Container(
        decoration: BoxDecoration(color: mainBackgroundColor),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Back icon if required
            if (isThereLeadingIcon)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(appBarPadding),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xfffeaecf0)),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context); // Go back
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      color: Colors.black,
                      iconSize: iconSize,
                    ),
                  ),
                ],
              ),
            // Title in the center
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: textLeftPadding),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
