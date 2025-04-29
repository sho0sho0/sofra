import 'package:flutter/material.dart';

// Entry point of the Flutter application
void main() {
  runApp(MyApp()); // Run the MyApp widget
}

// StatelessWidget for the main app configuration
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner
      home: ChargeWalletScreen(), // Set the home screen to ChargeWalletScreen
    );
  }
}

// StatefulWidget to manage the state of the ChargeWalletScreen
class ChargeWalletScreen extends StatefulWidget {
  @override
  State<ChargeWalletScreen> createState() => _ChargeWalletScreenState();
}

// State class for ChargeWalletScreen
class _ChargeWalletScreenState extends State<ChargeWalletScreen> {
  // Holds the currently selected payment method
  String _selectedMethod = "Master Card Or Visa";

  // Controllers for OTP fields
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // Get the screen size
    final bool isSmallScreen = size.width < 600; // Check if screen is small (e.g., phone)

    // List of available payment methods with image and title
    final List<Map<String, dynamic>> methods = [
      {"title": "Master Card Or Visa", "image": 'assets/images/mastercard.png'},
      {"title": "Digital Wallet", "image": 'assets/images/digitalwallet.png'},
      {"title": "Instapay", "image": 'assets/images/instapay.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200], // Light gray background
        elevation: 0, // No shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Back button icon
          onPressed: () => Navigator.pop(context), // Go back on tap
        ),
        title: Text('Charge Wallet', style: TextStyle(color: Colors.black)), // Title
        centerTitle: true, // Center the title
      ),
      backgroundColor: Colors.grey[200], // Page background
      body: SafeArea(
        child: SingleChildScrollView( // Makes body scrollable on smaller screens
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05), // Responsive horizontal padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Center align horizontally
              children: [
                SizedBox(height: size.height * 0.08), // Vertical space
                Text(
                  '150.000', // Displayed balance
                  style: TextStyle(
                    fontSize: isSmallScreen ? 36 : 48, // Responsive text size
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF026A75), // Teal color
                  ),
                ),
                SizedBox(height: 10), // Small space
                Text('Details', style: TextStyle(fontSize: isSmallScreen ? 14 : 18, color: Colors.grey)),
                SizedBox(height: 30),
                Text(
                  'Choose Your Method', // Section title
                  style: TextStyle(fontSize: isSmallScreen ? 16 : 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                // List of payment method options
                ListView.builder(
                  shrinkWrap: true, // Don't expand beyond children
                  physics: NeverScrollableScrollPhysics(), // Disable internal scroll
                  itemCount: methods.length, // Number of methods
                  itemBuilder: (context, index) {
                    final method = methods[index]; // Current method
                    return GestureDetector(
                      onTap: () => setState(() => _selectedMethod = method["title"]), // Select method on tap
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(isSmallScreen ? 15 : 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _selectedMethod == method["title"]
                                ? Color(0xFF026A75) // Highlight selected
                                : Colors.white,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            // Method icon
                            Image.asset(
                              method["image"],
                              height: isSmallScreen ? 30 : 40,
                              width: isSmallScreen ? 30 : 40,
                            ),
                            SizedBox(width: 15),
                            // Method title
                            Expanded(
                              child: Text(
                                method["title"],
                                style: TextStyle(fontSize: isSmallScreen ? 14 : 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            // Selection indicator
                            Icon(
                              _selectedMethod == method["title"]
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color: _selectedMethod == method["title"]
                                  ? Color(0xFF026A75)
                                  : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                // Continue button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF026A75), // Button color
                    minimumSize: Size(double.infinity, 50), // Full width button
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), // Rounded corners
                  ),
                  onPressed: () => _showCheckoutPopup(context), // Show bottom sheet on press
                  child: Text('Continue', style: TextStyle(fontSize: isSmallScreen ? 16 : 18, color: Colors.white)),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to show the bottom sheet for checkout input
  void _showCheckoutPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows bottom sheet to adjust to keyboard
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)), // Rounded top corners
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Take minimal vertical space
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text('Checkout', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10),
              _buildOTPField('Wallet number', otpController1), // Input field 1
              _buildOTPField('Pin', otpController2), // Input field 2
              _buildOTPField('OTP', otpController3), // Input field 3
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF026A75), // Button color
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () => Navigator.pop(context), // Close sheet on press
                child: Text('Charge', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  // Widget to build an individual OTP input field with label
  Widget _buildOTPField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, color: Colors.grey)), // Field label
        SizedBox(height: 5),
        TextField(
          controller: controller, // Attach controller
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)), // Rounded border
          ),
          keyboardType: TextInputType.number, // Numeric input
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
