import 'package:flutter/material.dart'; // Importing Flutter's material design package

void main() {
  runApp(MyApp()); // Entry point of the app, runs the MyApp widget
}

// Main widget of the app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner on top right
      home: MyOrdersPage(), // Sets the home screen to MyOrdersPage widget
    );
  }
}

// Widget that displays the orders page with tabs
class MyOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black), // Back button
            onPressed: () {}, // Action on back button press (currently empty)
          ),
          title: Text("My Order's", style: TextStyle(color: Colors.black)), // Page title
          elevation: 0, // Removes shadow under the AppBar
          bottom: TabBar(
            indicatorColor: Color(0xFF026A75), // Tab indicator color (teal)
            labelColor: Color(0xFF026A75), // Selected tab label color
            unselectedLabelColor: Colors.grey, // Unselected tab label color
            tabs: [
              Tab(text: "Ongoing"), // First tab
              Tab(text: "Completed"), // Second tab
              Tab(text: "Cancelled"), // Third tab
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OrderList(), // Content for "Ongoing" tab
            Center(child: Text("No completed orders")), // Placeholder for "Completed"
            Center(child: Text("No cancelled orders")), // Placeholder for "Cancelled"
          ],
        ),
      ),
    );
  }
}

// Widget that displays a list of ongoing orders
class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10, // Total number of orders to display
      separatorBuilder: (context, index) => Divider(color: Colors.grey, thickness: 1), // Line between items
      itemBuilder: (context, index) {
        return OrderCard(); // Each item is an OrderCard
      },
    );
  }
}

// Widget that displays a single order card
class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10), // Card margin
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start
        children: [
          Text("Food", style: TextStyle(color: Colors.black, fontSize: 16)), // Order category
          SizedBox(height: 10), // Spacing
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Rounded corners for the image
                      child: Image.asset(
                        "assets/images/food6.png", // Order image
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover, // Fit image in the box
                      ),
                    ),
                    SizedBox(width: 10), // Spacing between image and text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pizza Hut", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), // Restaurant name
                        Row(
                          children: [
                            Text("\$35.25", style: TextStyle(color: Colors.black, fontSize: 14)), // Order total
                            Text(" ", style: TextStyle(color: Colors.grey, fontSize: 14)), // Empty spacer
                            Text(" | ", style: TextStyle(color: Colors.grey, fontSize: 14)), // Separator
                            Text("03 Items", style: TextStyle(color: Colors.grey, fontSize: 14)), // Item count
                          ],
                        ),
                      ],
                    ),
                    Spacer(), // Pushes order number to the right
                    Text("#162432", style: TextStyle(color: Colors.grey, fontSize: 14)), // Order ID
                  ],
                ),
                SizedBox(height: 15), // Spacing before buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between buttons
                  children: [
                    ElevatedButton(
                      onPressed: () {}, // Action for "Track Order" button
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF026A75), // Teal background
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Rounded corners
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8), // Button padding
                        child: Text("Track Order", style: TextStyle(fontSize: 14, color: Colors.white)), // Button label
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {}, // Action for "Cancel" button
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Rounded corners
                        ),
                        side: BorderSide(color: Color(0xFF026A75)), // Border color
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8), // Button padding
                        child: Text("Cancel", style: TextStyle(fontSize: 14, color: Colors.teal)), // Button label
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
