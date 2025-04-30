import 'package:flutter/material.dart';
import 'package:sofra_app/components/customized_appbar.dart'; // Custom app bar widget
import 'package:sofra_app/components/customized_bottom_navigationbar.dart'; // Custom bottom navigation bar
import 'package:sofra_app/main.dart'; // Contains global variables like colors

// Wallet Screen to show the user's balance and wallet actions
class WalletScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // Get the current screen height and width
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: CustomizedAppBar(
        // Customized AppBar from components folder
        title: 'Wallet',
        isThereLeadingIcon: true,
        isThereTitle: true,
        appbarColor: mainBackgroundColor,
        iconBackgroundColor: mainBackgroundColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.0555,
          vertical: screenHeight * 0.00625,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Balance Card with Gradient Background ---
            Container(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.03125,
                horizontal: screenWidth * 0.05,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.0333),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryColor,
                    Colors.black
                  ], // Gradient from primary color to black
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Label: "Available balance"
                  Text(
                    "Available balance",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: screenWidth * 0.0333,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.0125),
                  // Balance Amount
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "14,235",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.075,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ".34 EGP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.047222,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01875),
                  // Two Action Buttons (add balance, add card)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      balanceAction(
                        Icons.add,
                        "add balance",
                        screenWidth,
                        screenHeight,
                      ),
                      balanceAction(
                        Icons.download,
                        "add card",
                        screenWidth,
                        screenHeight,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.0390625),

            // --- Menu Section ---
            Text(
              "Menu",
              style: TextStyle(
                fontSize: screenWidth * 0.0444,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(height: screenHeight * 0.0234375),

            // List of Menu Items
            Column(
              children: [
                menuItem(Icons.history, "History Transactions", screenWidth,
                    screenHeight),
                Divider(color: Color(0xFFE7E7F6), thickness: 1),
                menuItem(Icons.payment, "Request Payment", screenWidth,
                    screenHeight),
                Divider(color: Color(0xFFE7E7F6), thickness: 1),
                menuItem(Icons.settings, "Settings", screenWidth, screenHeight),
                Divider(color: Color(0xFFE7E7F6), thickness: 1),
                menuItem(Icons.help_outline, "Help", screenWidth, screenHeight),
              ],
            ),
          ],
        ),
      ),

      // Customized bottom navigation bar
      bottomNavigationBar: CustomizedBottomNavigationBar(),
    );
  }

  // --- Widget for Balance Action Buttons (add balance, add card) ---
  Widget balanceAction(
    IconData icon,
    String text,
    double screenWidth,
    double screenHeight,
  ) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: screenWidth * 0.055,
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
          text,
          style: TextStyle(
            color: Colors.white70,
            fontSize: screenWidth * 0.0333,
          ),
        ),
      ],
    );
  }

  // --- Widget for Each Menu Item Row ---
  Widget menuItem(
    IconData icon,
    String text,
    double screenWidth,
    double screenHeight,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.015,
        horizontal: screenWidth * 0.03,
      ),
      child: Row(
        children: [
          // Icon inside colored background
          Container(
            width: screenWidth * 0.079,
            height: screenWidth * 0.079,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(screenWidth * 0.025),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: screenWidth * 0.049,
            ),
          ),
          SizedBox(width: screenWidth * 0.04),
          // Menu Item Text
          Text(
            text,
            style: TextStyle(
              fontSize: screenWidth * 0.041,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
