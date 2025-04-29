// Importing Flutter's material design package
import 'package:flutter/material.dart';

// Entry point of the app
void main() {
  runApp(const MyApp()); // Runs the MyApp widget as the root
}

// Stateless widget that sets up the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: RequestPaymentScreen(), // Sets the main screen to RequestPaymentScreen
    );
  }
}

// Stateful widget for the payment request screen
class RequestPaymentScreen extends StatefulWidget {
  @override
  _RequestPaymentScreenState createState() => _RequestPaymentScreenState(); // Creates the mutable state
}

// State class for managing the UI and interactions
class _RequestPaymentScreenState extends State<RequestPaymentScreen> {
  int _selectedPaymentIndex = -1; // Tracks the selected payment method (-1 means none selected)

  // List of image paths for payment methods
  List<String> paymentMethods = [
    'assets/images/mastercard.png',
    'assets/images/digitalwallet.png',
    'assets/images/instapay.png'
  ];

  @override
  Widget build(BuildContext context) {
    // Getting screen dimensions for responsive layout
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // App bar with a back button and title
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back arrow icon
          onPressed: () {}, // Currently does nothing on press
        ),
        title: Text('Request Payment'), // AppBar title
        centerTitle: true, // Center the title
        elevation: 0, // Removes AppBar shadow
      ),

      // Body with padding and scrollable content
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Left align contents
            children: [
              SizedBox(height: screenHeight * 0.02), // Top spacing

              // Heading text
              Text('Choose Payment Request',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: screenHeight * 0.01), // Space after heading

              // Payment method selection row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Evenly space payment options
                children: List.generate(paymentMethods.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      // Update selected payment method
                      setState(() {
                        _selectedPaymentIndex = index;
                      });
                    },
                    child: Container(
                      width: screenWidth * 0.25,
                      height: screenHeight * 0.08,
                      decoration: BoxDecoration(
                        // Highlight border if selected
                        border: Border.all(
                          color: _selectedPaymentIndex == index
                              ? Color(0xFF026A75)
                              : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                        color: Colors.grey.shade200, // Light gray background
                      ),
                      // Display payment method image
                      child: Image.asset(paymentMethods[index],
                          fit: BoxFit.contain),
                    ),
                  );
                }),
              ),

              SizedBox(height: screenHeight * 0.05), // Space before form

              // Input fields (name, phone number, etc.)
              buildTextField('Name', 'Esmail Mahmoud', false),
              buildTextField('Phone Number', '01112547638', false),
              buildTextField('Order Number', '#142152', false),
              buildTextField('Reason', 'Write the Reason', true),

              SizedBox(height: screenHeight * 0.05), // Space before button

              // Submit button
              SizedBox(
                width: double.infinity, // Full width
                height: screenHeight * 0.06, // Button height
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF026A75), // Custom teal color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // Rounded edges
                    ),
                  ),
                  onPressed: () {}, // Button action (currently empty)
                  child: Text('Send', style: TextStyle(color: Colors.white)), // Button text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build text fields with consistent styling
  Widget buildTextField(String label, String hint, bool isMultiline) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Left align labels and fields
      children: [
        // Field label
        Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        SizedBox(height: 10), // Spacing

        // Input field
        TextField(
          maxLines: isMultiline ? 3 : 1, // Multiple lines if specified
          decoration: InputDecoration(
            hintText: hint, // Placeholder text
            filled: true,
            fillColor: Color.fromARGB(211, 224, 226, 226), // Light background
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), // Rounded corners
              borderSide: BorderSide.none, // No visible border
            ),
          ),
        ),
        SizedBox(height: 10), // Spacing below field
      ],
    );
  }
}
