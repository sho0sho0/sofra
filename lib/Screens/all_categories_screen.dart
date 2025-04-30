import 'package:flutter/material.dart';
import 'package:sofra_app/components/customized_appbar.dart';
import 'package:sofra_app/main.dart';

// Main screen showing all categories
class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          mainBackgroundColor, // Set background color from main.dart
      appBar: const CustomizedAppBar(
        appbarColor: Colors.white,
        title: 'All Categories', // App bar title
        isThereLeadingIcon: true,
        isThereTitle: true,
        iconBackgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Outer padding for the list
          child: Column(
            // Generate a list of container rows dynamically
            children: List.generate(
              4,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TwoContainersRow(
                      x: index * 2), // Each row shows 2 containers
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// Reusable container for each category item
class CategoryContainer extends StatefulWidget {
  const CategoryContainer({
    super.key,
    required this.imagename,
    required this.name,
  });

  final String imagename; // Name of the image to display
  final String name; // Category title

  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  Color borderColor = const Color(0xfffeaecf0); // Initial border color

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions to make the container responsive
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate container width and height based on screen size
    double containerWidth = screenWidth * 0.4; // 40% of screen width
    double containerHeight = screenHeight * 0.16; // 16% of screen height

    return GestureDetector(
      onTap: () {
        // When tapped, change the border color
        setState(() {
          borderColor = const Color(0xff026A75); // Change to green
        });

        // Navigate to "NotYet" screen after 200ms
        Future.delayed(const Duration(milliseconds: 200), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NotYet()),
          ).then((value) {
            // When returning, reset the border color
            setState(() {
              borderColor = const Color(0xfffeaecf0); // Back to initial color
            });
          });
        });
      },
      child: Container(
        height: containerHeight,
        width: containerWidth,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor), // Apply dynamic border color
          borderRadius: BorderRadius.circular(16.0), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/${widget.imagename}', // Load image dynamically
              ),
              const Spacer(), // Push text down
              Text(
                widget.name, // Display category name
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget that shows two CategoryContainers in one row
class TwoContainersRow extends StatelessWidget {
  TwoContainersRow({super.key, required this.x});

  int x; // Index offset for which categories to show

  // Static list of all categories with their images
  List<CategoryData> Categories = [
    CategoryData(imageName: 'emj1.png', name: 'Main Dishes'),
    CategoryData(imageName: 'emj2.png', name: 'Healthy Meals'),
    CategoryData(imageName: 'emj3.png', name: 'Beverages'),
    CategoryData(imageName: 'emj4.png', name: 'Snacks'),
    CategoryData(imageName: 'emj5.png', name: 'Desserts'),
    CategoryData(imageName: 'emj6.png', name: 'Salads'),
    CategoryData(imageName: 'emj7.png', name: 'Ready-To-Eat'),
    CategoryData(imageName: 'emj8.png', name: 'Appetizers'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(), // Create space before first container
        CategoryContainer(
          imagename: Categories[x].imageName,
          name: Categories[x].name,
        ),
        const Spacer(), // Space between the two containers
        CategoryContainer(
          imagename: Categories[x + 1].imageName,
          name: Categories[x + 1].name,
        ),
        const Spacer(), // Space after second container
      ],
    );
  }
}

// Model class to store each category's data (name + image)
class CategoryData {
  final String name;
  final String imageName;

  CategoryData({required this.imageName, required this.name});
}

// Simple "Not Yet" screen (opened when clicking a category)
class NotYet extends StatelessWidget {
  const NotYet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NOT YET'), // Simple appbar title
      ),
    );
  }
}
