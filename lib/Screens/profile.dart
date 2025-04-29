import 'package:flutter/material.dart'; // Importing Flutter's material design library

void main() {
  runApp(const MyApp()); // Entry point of the app, running MyApp widget
}

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: ProfileScreen(), // Sets the home screen to ProfileScreen widget
    );
  }
}

// ProfileScreen is a stateful widget, as it includes UI that changes (switches)
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState(); // Creates mutable state
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Two boolean variables to manage switch states
  bool isPushNotificationOn = true;
  bool isPromoNotificationOn = false;

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[200], // Light grey background
      body: SafeArea( // Ensures content is not under the system UI
        child: SingleChildScrollView( // Makes the content scrollable
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, // 5% horizontal padding
              vertical: screenHeight * 0.02, // 2% vertical padding
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // User's profile picture
                CircleAvatar(
                  radius: screenWidth * 0.12, // Size relative to screen width
                  backgroundImage: AssetImage('assets/images/profile pic.jpeg'),
                ),
                SizedBox(height: screenHeight * 0.015), // Spacing
                // User's name
                Text(
                  "Emmie Watson",
                  style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                ),
                // User's email
                Text("emmie1709@gmail.com", style: TextStyle(color: Colors.grey)),
                SizedBox(height: screenHeight * 0.03), // Spacing

                // Card with personal info options
                _buildCard(
                  children: [
                    _buildListTile(Icons.person_outline, "Personal information"),
                    _buildListTile(Icons.language, "Language", trailing: Text("English (US)")),
                    _buildListTile(Icons.privacy_tip_outlined, "Privacy Policy"),
                    _buildListTile(Icons.settings, "Setting"),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02), // Spacing

                // Card with switch toggles for notifications
                _buildCard(
                  children: [
                    _buildListTile(
                      Icons.notifications_active_outlined, 
                      "Push Notifications",
                      trailing: Switch(
                        value: isPushNotificationOn, // Current value of the switch
                        activeColor: Color(0xFF026A75), // Custom teal color
                        onChanged: (bool value) {
                          setState(() {
                            isPushNotificationOn = value; // Toggle value and rebuild UI
                          });
                        },
                      ),
                    ),
                    _buildListTile(
                      Icons.notifications_active_outlined, 
                      "Promotional Notifications", 
                      trailing: Switch(
                        value: isPromoNotificationOn, // Current value of the switch
                        activeColor: Color(0xFF026A75), // Custom teal color
                        onChanged: (bool value) {
                          setState(() {
                            isPromoNotificationOn = value; // Toggle value and rebuild UI
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02), // Spacing

                // Card with help and logout options
                _buildCard(
                  children: [
                    _buildListTile(Icons.help_outline, "Help Center"),
                    _buildListTile(Icons.logout, "Log Out", iconColor: Colors.red), // Red icon for emphasis
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      // Bottom navigation bar for navigating between app sections
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // White background
        type: BottomNavigationBarType.fixed, // All items always shown
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.face_outlined), label: 'Profile'),
        ],
        selectedItemColor: Colors.grey, // Color for selected item
        unselectedItemColor: Colors.grey, // Same color for consistency
        currentIndex: 2, // Highlights the third item (Cart)
        onTap: (index) {
          // Placeholder: implement navigation functionality
        },
      ),
    );
  }

  // Reusable method to build a card with a list of widgets inside
  Widget _buildCard({required List<Widget> children}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Rounded corners
      child: Column(children: children), // Add provided widgets vertically
    );
  }

  // Reusable method to build a list tile with an icon, title, and optional trailing widget and icon color
  Widget _buildListTile(IconData icon, String title, {Widget? trailing, Color? iconColor}) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.black54), // Default icon color is grey
      title: Text(title),
      trailing: trailing, // Optional trailing widget (e.g. switch, text)
    );
  }
}
