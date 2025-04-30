import 'package:flutter/material.dart';

class CustomizedBottomNavigationBar extends StatelessWidget {
  const CustomizedBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen size to adjust scaling
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate the scaling factor based on screen width
    double scalingFactor = screenWidth / 1080;

    // You can adjust the font size and icon size according to the scaling factor
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 70 * scalingFactor, // Scales the icon size
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_bag,
            size: 70 * scalingFactor, // Scales the icon size
          ),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
            size: 70 * scalingFactor, // Scales the icon size
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.face,
            size: 70 * scalingFactor, // Scales the icon size
          ),
          label: 'Profile',
        ),
      ],
      selectedItemColor: const Color(0xFF026A75),
      unselectedItemColor: const Color(0xff878787),
      currentIndex: 0,
      onTap: (index) {},
    );
  }
}
