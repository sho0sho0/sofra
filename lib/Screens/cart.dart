// Importing Flutter material design package
import 'package:flutter/material.dart';

// Entry point of the Flutter application
void main() {
  runApp(CartApp()); // Runs the CartApp widget
}

// Stateless widget that serves as the root of the app
class CartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: CartScreen(), // Sets CartScreen as the home screen
    );
  }
}

// Main screen widget for the cart, stateful to manage dynamic changes
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

// State class for CartScreen
class _CartScreenState extends State<CartScreen> {
  // List of items in the cart with details like image, name, size, price, quantity etc.
  List<Map<String, dynamic>> cartItems = [
    {
      'image': 'assets/images/food1.png',
      'name': 'Sweet Black Shirt',
      'size': 'Size L',
      'price': 22.00,
      'discountedPrice': null,
      'quantity': 1,
      'selected': true,
    },
    {
      'image': 'assets/images/food2.png',
      'name': 'Converse Play CDG',
      'size': 'Size 11',
      'price': 70.00,
      'discountedPrice': 63.00,
      'quantity': 1,
      'selected': true,
    },
    {
      'image': 'assets/images/food3.png',
      'name': 'Cream Hoodie',
      'size': 'Size L',
      'price': 52.00,
      'discountedPrice': null,
      'quantity': 2,
      'selected': true,
    },
  ];

  // Calculates total price based on selected items
  double getTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      if (item['selected']) {
        total += (item['discountedPrice'] ?? item['price']) * item['quantity'];
      }
    }
    return total;
  }

  // Increases item quantity
  void incrementQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  // Decreases item quantity (minimum of 1)
  void decrementQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  // Toggles selection checkbox for an item
  void toggleSelection(int index, bool? value) {
    setState(() {
      cartItems[index]['selected'] = value ?? false;
    });
  }

  // Deletes an item from the cart
  void deleteItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // Custom app bar at the top
      appBar: CustomizedAppBar(
        title: 'Cart',
        isThereLeadingIcon: false,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Cart item list takes available vertical space
            Expanded(
              child: ListView.separated(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index]; // Current item
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.01,
                      vertical: screenHeight * 0.01,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Selection checkbox
                        Checkbox(
                          checkColor: Colors.white,
                          value: item['selected'],
                          onChanged: (value) => toggleSelection(index, value),
                        ),
                        // Product image with rounded corners
                        ClipRRect(
                          borderRadius: BorderRadius.circular(screenWidth * 0.02),
                          child: Image.asset(
                            item['image'],
                            width: screenWidth * 0.2,
                            height: screenWidth * 0.2,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        // Product name, size, and price
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.03,
                                ),
                              ),
                              Text(
                                item['size'],
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenWidth * 0.03,
                                ),
                              ),
                              Row(
                                children: [
                                  // Original price if discounted
                                  if (item['discountedPrice'] != null)
                                    Text(
                                      '\$${item['price'].toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: screenWidth * 0.03,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  SizedBox(width: screenWidth * 0.02),
                                  // Final price
                                  Text(
                                    '\$${(item['discountedPrice'] ?? item['price']).toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: const Color(0xFF026A75),
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * 0.03,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Delete and quantity controls
                        Column(
                          children: [
                            // Delete button
                            IconButton(
                              icon: Icon(Icons.delete, color: const Color(0xFF026A75)),
                              onPressed: () => deleteItem(index),
                            ),
                            // Quantity control container
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.03,
                                vertical: screenHeight * 0.01,
                              ),
                              child: Row(
                                children: [
                                  // Decrease quantity
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () => decrementQuantity(index),
                                  ),
                                  // Quantity display
                                  Text(
                                    '${item['quantity']}',
                                    style: TextStyle(fontSize: screenWidth * 0.05),
                                  ),
                                  // Increase quantity
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () => incrementQuantity(index),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                // Divider between items
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey[400],
                    thickness: 1,
                    indent: screenWidth * 0.02,
                    endIndent: screenWidth * 0.02,
                  );
                },
              ),
            ),
            // Checkout section
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Total price row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Price',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                      Text(
                        '\$${getTotalPrice().toStringAsFixed(2)}',
                        style: TextStyle(
                          color: const Color(0xFF026A75),
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Checkout button
                  ElevatedButton(
                    onPressed: () {
                      // Handle checkout
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF026A75),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    ),
                    child: Text(
                      'Check Out',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom navigation bar for navigating between main pages
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shopping Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Profile',
          ),
        ],
        selectedItemColor: const Color(0xFF026A75),
        unselectedItemColor: Colors.grey,
        currentIndex: 2, // Currently selected tab is the cart
        onTap: (index) {
          // Handle bottom navigation taps
        },
      ),
    );
  }
}

// Custom reusable AppBar widget
class CustomizedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isThereLeadingIcon;

  const CustomizedAppBar({
    required this.title,
    required this.isThereLeadingIcon,
  });

  @override
  Size get preferredSize => const Size.fromHeight(90); // AppBar height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      elevation: 0,
      leading: isThereLeadingIcon
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.black,
              onPressed: () => Navigator.pop(context),
            )
          : null,
    );
  }
}
