import 'package:flutter/material.dart';
import 'package:sofra_app/components/customized_appbar.dart';
import 'package:sofra_app/main.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({Key? key}) : super(key: key);

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  // List of meal categories that the user can choose from
  final List<String> categories = [
    'All Meal\'s',
    'Burger',
    'Rice',
    'Spaghetti'
  ];

  // Index to track the currently selected category
  int selectedCategoryIndex = 0;

  // List of image assets for each meal item (each index corresponds to a category)
  final List<String> mealsImages = [
    'assets/meals1.png',
    'assets/meals2.png',
    'assets/meals3.png',
    'assets/meals4.png',
  ];

  @override
  Widget build(BuildContext context) {
    // Getting screen width and height to make the design responsive
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      // Customized AppBar widget for consistent app header
      appBar: CustomizedAppBar(
        title: 'Meals',
        isThereLeadingIcon:
            true, // Determines if the leading icon (like back button) is shown
        isThereTitle: true, // Determines if the title is displayed
        appbarColor: Colors.transparent, // Makes app bar transparent
        iconBackgroundColor:
            Colors.transparent, // Makes icon background transparent
      ),
      body: Padding(
        // Adding padding around the content to make it look nice on all screen sizes
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.0125, horizontal: screenWidth * 0.0444),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Call to function that builds the categories bar
            _buildCategories(screenWidth, screenHeight),
            SizedBox(
                height: screenHeight *
                    0.025), // Spacer between categories and meal list
            // Expanding the meal list to fill remaining space
            Expanded(child: _buildMealsList(screenWidth, screenHeight)),
          ],
        ),
      ),
    );
  }

  // Function to build the categories section (e.g., All Meals, Burger, Rice, Spaghetti)
  Widget _buildCategories(double screenWidth, double screenHeight) {
    return SingleChildScrollView(
      // Scrolls horizontally when the categories overflow the screen width
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          // Check if the current category is selected
          bool isSelected = index == selectedCategoryIndex;
          return GestureDetector(
            onTap: () {
              // Update the selected category index when a category is tapped
              setState(() {
                selectedCategoryIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.0444),
              child: Text(
                categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // Change text color and underline if the category is selected
                  color: isSelected ? primaryColor : Colors.grey,
                  decoration: isSelected ? TextDecoration.underline : null,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // Function to build the list of meals (images of meals in this case)
  Widget _buildMealsList(double screenWidth, double screenHeight) {
    return ListView.builder(
      // This will dynamically generate a list of meal items
      itemCount: mealsImages.length, // Total number of meal items
      itemBuilder: (context, index) {
        return Container(
          // Each meal item is wrapped in a container with an image
          margin: EdgeInsets.only(
              bottom: screenHeight * 0.025), // Margin between items
          height: screenHeight *
              0.2343, // Set a fixed height for the meal image container
          decoration: BoxDecoration(
            // Set rounded corners for each meal item container
            borderRadius: BorderRadius.circular(screenWidth * 0.0444),
            image: DecorationImage(
              image: AssetImage(
                  mealsImages[index]), // Set the image from the assets list
              fit: BoxFit.cover, // Cover the entire container with the image
            ),
          ),
        );
      },
    );
  }
}
