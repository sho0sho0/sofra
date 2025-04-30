import 'package:flutter/material.dart';
import 'package:sofra_app/components/customized_appbar.dart';
import 'package:sofra_app/components/customized_bottom_navigationbar.dart';
import 'package:sofra_app/main.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive layout
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // Custom app bar with the title 'Search' and specific properties
      appBar: const CustomizedAppBar(
        title: 'Search', // Title of the app bar
        isThereLeadingIcon:
            true, // Whether to show a leading icon (back button)
        isThereTitle: true, // Whether to show the title
        appbarColor: Colors.white, // App bar color
        iconBackgroundColor: Colors.transparent, // Background color of the icon
      ),
      body: Column(
        children: [
          const SearchBar(), // Custom search bar widget
          SizedBox(
            height: screenHeight * 0.009, // Small vertical gap between elements
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth *
                    0.04), // Horizontal padding around the TextsRow widget
            child: const TextsRow(), // Custom widget displaying rows of text
          ),
          SearchResultItem(), // Custom widget that displays search results
        ],
      ),
      bottomNavigationBar:
          const CustomizedBottomNavigationBar(), // Custom bottom navigation bar
      backgroundColor: mainBackgroundColor, // Background color for the screen
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final List<bool> _selectedSuggestions = List.generate(8, (index) => false);
  final List<bool> _selectedDistance = List.generate(3, (index) => false);
  String? _selectedSortOption;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04, vertical: screenHeight * 0.006),
      child: SizedBox(
        height: screenHeight * 0.06,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search menu, restaurant or etc...',
            hintStyle: TextStyle(
              color: const Color(0xff878787),
              fontSize: screenHeight * 0.02,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: const Color(0xff878787),
              size: screenHeight * 0.03,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.filter_list,
                color: const Color(0xff878787),
                size: screenHeight * 0.03,
              ),
              onPressed: () {
                showFilterDialog(context);
              },
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xFFD6D6D6)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xFFD6D6D6)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xFFD6D6D6)),
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01, horizontal: screenWidth * 0.04),
          ),
        ),
      ),
    );
  }

  Future<void> showFilterDialog(BuildContext context) {
    RangeValues priceRange =
        const RangeValues(0, 500); // Initial price range values

    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white, // Background color for the bottom sheet
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), // Rounded corners for the top of the sheet
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            // Get screen dimensions for responsive design
            double screenHeight = MediaQuery.of(context).size.height;
            double screenWidth = MediaQuery.of(context).size.width;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(
                    screenHeight * 0.02), // Padding around the dialog
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header section with a close button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          onPressed: () {
                            Navigator.pop(
                                context); // Close the bottom sheet when the button is pressed
                          },
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Filter and Arrange', // Title of the dialog
                              style: TextStyle(
                                fontSize: screenHeight *
                                    0.025, // Adjust font size based on screen height
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            width: screenWidth * 0.12), // Spacer for layout
                      ],
                    ),
                    SizedBox(
                        height:
                            screenHeight * 0.02), // Spacing between sections

                    // Price range section
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      child: Text(
                        'Price scale', // Label for the price range section
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.02, // Adjust font size
                        ),
                      ),
                    ),
                    RangeSlider(
                      values: priceRange, // Current selected price range
                      min: 0, // Minimum price
                      max: 500, // Maximum price
                      divisions: 500, // Number of divisions for the slider
                      labels: RangeLabels(
                        '\$${priceRange.start.round()}', // Label for the start price
                        '\$${priceRange.end.round()}', // Label for the end price
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          priceRange =
                              values; // Update the price range when slider changes
                        });
                      },
                      activeColor: primaryColor, // Active slider color
                      inactiveColor:
                          const Color(0xFFE3E9ED), // Inactive slider color
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${priceRange.start.round()}', // Display start price
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.02,
                          ),
                        ),
                        Text(
                          '\$${priceRange.end.round()}', // Display end price
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.02,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // Suggestion buttons section
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      child: Text(
                        'Suggestion', // Label for the suggestion buttons section
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.02,
                        ),
                      ),
                    ),
                    Wrap(
                      spacing: screenWidth * 0.02, // Spacing between buttons
                      runSpacing: screenHeight * 0.02, // Spacing between rows
                      children: List.generate(
                        8, // Generate 8 buttons for suggestions
                        (index) => ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedSuggestions[index] =
                                  !_selectedSuggestions[
                                      index]; // Toggle suggestion selection
                              print(
                                  'Button $index pressed, selected: ${_selectedSuggestions[index]}');
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _selectedSuggestions[index]
                                ? primaryColor // Color when selected
                                : const Color(
                                    0xffE3E9ED), // Color when unselected
                            foregroundColor: _selectedSuggestions[index]
                                ? Colors.white // Text color when selected
                                : Colors.black, // Text color when unselected
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.03),
                            ),
                          ),
                          child: Text(
                            'Burger', // Button label
                            style: TextStyle(
                              color: _selectedSuggestions[index]
                                  ? Colors.white // Text color when selected
                                  : const Color(
                                      0xfff78828a), // Text color when unselected
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // Distance buttons section
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      child: Text(
                        'Distance', // Label for the distance buttons section
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.02,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        3, // Generate 3 buttons for distance options
                        (index) => ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedDistance[index] = !_selectedDistance[
                                  index]; // Toggle distance selection
                              print(
                                  'Distance $index pressed, selected: ${_selectedDistance[index]}');
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _selectedDistance[index]
                                ? primaryColor // Color when selected
                                : const Color(
                                    0xffE3E9ED), // Color when unselected
                            foregroundColor: _selectedDistance[index]
                                ? Colors.white // Text color when selected
                                : Colors.black, // Text color when unselected
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.03),
                            ),
                          ),
                          child: Text(
                            index == 0
                                ? '<5KM'
                                : index == 1
                                    ? '5KM - 10KM'
                                    : '>10KM', // Distance button labels
                            style: TextStyle(
                              color: _selectedDistance[index]
                                  ? Colors.white // Text color when selected
                                  : const Color(
                                      0xfff78828a), // Text color when unselected
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // Sorting options section
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      child: Text(
                        'Sort By', // Label for the sorting options section
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.02,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        // High to Low Price option
                        Container(
                          padding: EdgeInsets.all(screenHeight * 0.01),
                          child: RadioListTile<String>(
                            title: Text(
                              'Price: High to Low', // Option label
                              style: TextStyle(
                                color: const Color(0xfff78828a),
                                fontSize: screenHeight * 0.02,
                              ),
                            ),
                            value: 'HighToLow',
                            groupValue:
                                _selectedSortOption, // Current selected sort option
                            onChanged: (String? value) {
                              setState(() {
                                _selectedSortOption =
                                    value; // Update sort option
                              });
                            },
                            tileColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Color(0xFF78828A),
                                width: 1,
                              ),
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.03),
                            ),
                            activeColor: const Color(0xFF78828A),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: screenWidth * 0.04),
                          ),
                        ),

                        // Low to High Price option
                        Container(
                          padding: EdgeInsets.all(screenHeight * 0.01),
                          child: RadioListTile<String>(
                            title: Text(
                              'Price: Low to High', // Option label
                              style: TextStyle(
                                color: const Color(0xfff78828a),
                                fontSize: screenHeight * 0.02,
                              ),
                            ),
                            value: 'LowToHigh',
                            groupValue: _selectedSortOption,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedSortOption = value;
                              });
                            },
                            tileColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Color(0xFF78828A),
                                width: 1,
                              ),
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.03),
                            ),
                            activeColor: const Color(0xFF78828A),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: screenWidth * 0.04),
                          ),
                        ),

                        // Nearest option
                        Container(
                          padding: EdgeInsets.all(screenHeight * 0.01),
                          child: RadioListTile<String>(
                            title: Text(
                              'Nearest', // Option label
                              style: TextStyle(
                                color: const Color(0xfff78828a),
                                fontSize: screenHeight * 0.02,
                              ),
                            ),
                            value: 'Nearest',
                            groupValue: _selectedSortOption,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedSortOption = value;
                              });
                            },
                            tileColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Color(0xFF78828A),
                                width: 1,
                              ),
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.03),
                            ),
                            activeColor: const Color(0xFF78828A),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: screenWidth * 0.04),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.02),

                        // Apply Button to apply the filters
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the filter dialog
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                            ),
                            child: Text(
                              'Apply', // Button label
                              style: TextStyle(
                                color: const Color(0xffFFFFFF),
                                fontSize: screenHeight * 0.02,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class TextsRow extends StatelessWidget {
  const TextsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        // Text showing the "Showing" label
        Text(
          'Showing ',
          style: TextStyle(
            fontSize:
                screenHeight * 0.02, // Font size responsive to screen height
            color: const Color(0xfff999ba9), // Light gray color
          ),
        ),

        // Text showing the category, in this case, "Pasta"
        Text(
          '"Pasta"',
          style: TextStyle(
            fontSize:
                screenHeight * 0.025, // Font size slightly larger for emphasis
            fontWeight: FontWeight.w500, // Medium weight for emphasis
          ),
        ),

        // Spacer widget that takes up remaining space between the texts
        const Spacer(),

        // Text showing the total number of results, e.g., "16 Results"
        Text(
          '16 Results',
          style: TextStyle(
            fontSize:
                screenHeight * 0.021, // Font size responsive to screen height
            color: const Color(0xfff999ba9), // Light gray color
          ),
        ),
      ],
    );
  }
}

class SearchResultItemContainerData {
  String imageName;
  String title;
  double rating;
  int num;
  String deliveryInfo;
  String duration;
  int categoriesChipsNum;
  List<String> categoriesChips;

  // Constructor to initialize the properties of the search result item
  SearchResultItemContainerData({
    required this.imageName,
    required this.title,
    required this.rating,
    required this.num,
    required this.deliveryInfo,
    required this.duration,
    required this.categoriesChipsNum,
    required this.categoriesChips,
  });
}

class SearchResultItemContainer extends StatelessWidget {
  const SearchResultItemContainer({
    super.key,
    required this.results, // List of SearchResultItemContainerData passed to display
  });

  final List<SearchResultItemContainerData> results;

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color for the container
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligning children to the start
        children: [
          // Stack widget to layer the image and other UI elements
          Stack(
            children: [
              // Image of the search result item (using assets)
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/${results[0].imageName}', // Image source from assets
                  height: screenHeight * 0.195, // Height is responsive
                  width: double.infinity, // Full width
                  fit: BoxFit
                      .cover, // Ensures the image covers the space without distortion
                ),
              ),

              // Positioned widget for the rating box
              Positioned(
                top: screenHeight * 0.01,
                left: screenWidth * 0.005,
                child: SizedBox(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenHeight * 0.02,
                        vertical: screenHeight * 0.006),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffFE724C),
                          blurRadius: 1,
                          offset: Offset(0, 0.5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Text(
                          '${results[0].rating}', // Displaying the rating
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.014,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Icon(Icons.star,
                            color: const Color(0xfffffc529),
                            size: screenHeight * 0.014),
                        const SizedBox(width: 4),
                        Text(
                          '(${results[0].num}+)', // Number of reviews
                          style: TextStyle(
                            fontSize: screenHeight * 0.007,
                            color: const Color(0xfff9796a1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Positioned widget for the heart icon (favorite)
              Positioned(
                top: screenHeight * 0.015,
                right: screenWidth * 0.005,
                child: SizedBox(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xffffe724c),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffFE724C),
                          blurRadius: 1,
                          offset: Offset(0, 0.5),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: screenHeight * 0.02,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Spacing between elements
          SizedBox(height: screenHeight * 0.015),

          // Title and check icon for verification
          Row(
            children: [
              Text(
                results[0].title, // Restaurant title
                style: TextStyle(
                    fontSize: screenHeight * 0.02, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: screenWidth * 0.013),
              Icon(
                Icons.check_circle,
                color: const Color(0xfff029094),
                size: screenHeight * 0.017,
              )
            ],
          ),

          // Spacing between title and other information
          SizedBox(height: screenHeight * 0.003),

          // Delivery info and duration
          Row(
            children: [
              Icon(Icons.delivery_dining,
                  size: screenHeight * 0.014, color: const Color(0xffffe724c)),
              SizedBox(width: screenWidth * 0.013),
              Text(
                results[0].deliveryInfo, // Delivery information
                style: TextStyle(
                  color: const Color(0xfff7e8392),
                  fontSize: screenHeight * 0.014,
                ),
              ),
              SizedBox(width: screenWidth * 0.02),
              Icon(
                Icons.timer,
                size: screenHeight * 0.014,
                color: const Color(0xffffe724c),
              ),
              SizedBox(width: screenWidth * 0.013),
              Text(
                results[0].duration, // Delivery time duration
                style: TextStyle(
                  color: const Color(0xfff7e8392),
                  fontSize: screenHeight * 0.014,
                ),
              ),
            ],
          ),

          // Spacing before the categories
          SizedBox(height: screenHeight * 0.007),

          // Categories displayed as chips in a horizontal list
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < results[0].categoriesChipsNum; i++)
                        CategoryChip(
                          label: results[0]
                              .categoriesChips[i], // Category chip widget
                        ),
                      SizedBox(width: screenWidth * 0.013),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;

  // Constructor to accept the label for the chip
  const CategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      // Container to style the chip with padding and background color
      padding: EdgeInsets.symmetric(
          horizontal:
              screenWidth * 0.01, // Horizontal padding based on screen width
          vertical:
              screenHeight * 0.004), // Vertical padding based on screen height
      decoration: BoxDecoration(
        // Box decoration for background color and rounded corners
        color: const Color(0xffff6f6f6), // Background color of the chip
        borderRadius: BorderRadius.circular(5), // Rounded corners for the chip
      ),
      child: Center(
        // Center the text inside the chip
        child: Text(
          label, // Text inside the chip
          style: TextStyle(
            fontSize: screenHeight * 0.01, // Font size based on screen height
            color: const Color(0xfff8a8e9b), // Text color for the chip
          ),
        ),
      ),
    );
  }
}

class SearchResultItem extends StatelessWidget {
  SearchResultItem({
    super.key,
  });

  // Sample data for the search result items
  final List<SearchResultItemContainerData> results = [
    // List of sample result data with image, title, rating, and categories
    SearchResultItemContainerData(
      imageName: 'search1.png',
      title: 'McDonald’s',
      rating: 4.5,
      num: 25,
      deliveryInfo: 'Free delivery',
      duration: '10-15 mins',
      categoriesChipsNum: 6,
      categoriesChips: [
        'BURGER',
        'CHICKEN',
        'FASTFOOD',
        'BURGER',
        'CHICKEN',
        'FASTFOOD'
      ],
    ),
    SearchResultItemContainerData(
      imageName: 'search2.png',
      title: 'Papa john’s',
      rating: 2.5,
      num: 25,
      deliveryInfo: 'Free delivery',
      duration: '10-15 mins',
      categoriesChipsNum: 5,
      categoriesChips: [
        'BURGER',
        'CHICKEN',
        'FASTFOOD',
        'BURGER',
        'CHICKEN',
      ],
    ),
    SearchResultItemContainerData(
      imageName: 'search3.png',
      title: 'McDonald’s',
      rating: 1.5,
      num: 25,
      deliveryInfo: 'Free delivery',
      duration: '10-15 mins',
      categoriesChipsNum: 4,
      categoriesChips: [
        'BURGER',
        'CHICKEN',
        'FASTFOOD',
        'BURGER',
      ],
    ),
    SearchResultItemContainerData(
      imageName: 'search4.png',
      title: 'McDonald’s',
      rating: 5.0,
      num: 25,
      deliveryInfo: 'Free delivery',
      duration: '10-15 mins',
      categoriesChipsNum: 3,
      categoriesChips: [
        'BURGER',
        'CHICKEN',
        'FASTFOOD',
      ],
    ),
    SearchResultItemContainerData(
      imageName: 'search1.png',
      title: 'McDonald’s',
      rating: 4.5,
      num: 25,
      deliveryInfo: 'Free delivery',
      duration: '10-15 mins',
      categoriesChipsNum: 6,
      categoriesChips: [
        'BURGER',
        'CHICKEN',
        'FASTFOOD',
        'BURGER',
        'CHICKEN',
        'FASTFOOD'
      ],
    ),
    SearchResultItemContainerData(
      imageName: 'search2.png',
      title: 'Papa john’s',
      rating: 2.5,
      num: 25,
      deliveryInfo: 'Free delivery',
      duration: '10-15 mins',
      categoriesChipsNum: 5,
      categoriesChips: [
        'BURGER',
        'CHICKEN',
        'FASTFOOD',
        'BURGER',
        'CHICKEN',
      ],
    ),
    SearchResultItemContainerData(
      imageName: 'search3.png',
      title: 'McDonald’s',
      rating: 1.5,
      num: 25,
      deliveryInfo: 'Free delivery',
      duration: '10-15 mins',
      categoriesChipsNum: 4,
      categoriesChips: [
        'BURGER',
        'CHICKEN',
        'FASTFOOD',
        'BURGER',
      ],
    ),
    SearchResultItemContainerData(
      imageName: 'search4.png',
      title: 'McDonald’s',
      rating: 5.0,
      num: 25,
      deliveryInfo: 'Free delivery',
      duration: '10-15 mins',
      categoriesChipsNum: 3,
      categoriesChips: [
        'BURGER',
        'CHICKEN',
        'FASTFOOD',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      // Main container wrapping the list view
      child: Padding(
        padding: EdgeInsets.only(
            top: screenHeight * 0.019, // Add top padding based on screen height
            left: screenWidth * 0.04, // Add left padding based on screen width
            right:
                screenWidth * 0.04), // Add right padding based on screen width
        child: ListView.builder(
          // Create a scrollable list of results
          itemCount: (results.length / 2)
              .ceil(), // Count how many rows we need (two items per row)
          itemBuilder: (BuildContext context, int index) {
            final int start = index * 2; // Start index for this row
            final int end = (start + 2).clamp(
                0,
                results
                    .length); // End index for this row (limit to total number of results)
            final rowItems =
                results.sublist(start, end); // Get the results for this row

            return Padding(
              padding: EdgeInsets.only(
                  bottom: screenHeight * 0.019), // Bottom padding for each row
              child: Row(
                // Row to display two items side by side
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: rowItems.map((result) {
                  return Expanded(
                    // Make each result item take equal space within the row
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth *
                              0.01), // Horizontal padding between items
                      child: SearchResultItemContainer(results: [
                        result
                      ]), // Container for each search result item
                    ),
                  );
                }).toList(), // Convert the rowItems to a list of widgets
              ),
            );
          },
        ),
      ),
    );
  }
}
