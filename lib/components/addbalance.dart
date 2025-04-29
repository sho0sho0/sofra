import 'package:flutter/material.dart';

// Entry point of the Flutter application
void main() {
  runApp(MyApp());
}

// Root widget of the app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: AddBalanceScreen(), // Sets AddBalanceScreen as the home screen
    );
  }
}

// Stateful widget to manage balance input
class AddBalanceScreen extends StatefulWidget {
  @override
  _AddBalanceScreenState createState() => _AddBalanceScreenState();
}

// State class for AddBalanceScreen
class _AddBalanceScreenState extends State<AddBalanceScreen> {
  String _balance = '0'; // Initial balance shown on screen

  // Method to update the balance value based on user input
  void _updateBalance(String value) {
    setState(() {
      if (value == 'back') {
        // If backspace is pressed
        if (_balance.length > 1) {
          _balance = _balance.substring(0, _balance.length - 1); // Remove last character
        } else {
          _balance = '0'; // Reset to 0 if only one character is left
        }
      } else if (value == '.') {
        // If decimal point is pressed, add only if not already present
        if (!_balance.contains('.')) {
          _balance += value;
        }
      } else {
        // Append numbers or replace 0
        if (_balance == '0') {
          _balance = value;
        } else {
          _balance += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Check if screen is small for responsive layout
        final isSmallScreen = constraints.maxWidth < 600;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0, // Remove shadow
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context); // Go back to previous screen
              },
            ),
            title: Text(
              'Add Balance',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true, // Center the title
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space evenly
              children: [
                // Display the balance value
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text(
                    _balance,
                    style: TextStyle(
                      fontSize: constraints.maxWidth * 0.08, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF026A75),
                    ),
                  ),
                ),
                // Numeric keypad using GridView
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: GridView.builder(
                    shrinkWrap: true, // Let GridView take only needed space
                    physics: const NeverScrollableScrollPhysics(), // Disable scroll
                    itemCount: 12, // 0-9, dot, and backspace
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isSmallScreen ? 3 : 4, // Columns
                      crossAxisSpacing: constraints.maxWidth * 0.02,
                      mainAxisSpacing: constraints.maxWidth * 0.02,
                    ),
                    itemBuilder: (context, index) {
                      // Dot button at index 9
                      if (index == 9) {
                        return GestureDetector(
                          onTap: () => _updateBalance('.'),
                          child: Center(
                            child: Text(
                              '.',
                              style: TextStyle(
                                fontSize: constraints.maxWidth * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }
                      // Backspace button at index 11
                      else if (index == 11) {
                        return GestureDetector(
                          onTap: () => _updateBalance('back'),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: constraints.maxWidth * 0.05,
                          ),
                        );
                      }
                      // Digits 1–9 and 0 at index 10
                      else {
                        final value = index == 10 ? '0' : '${index + 1}';
                        return GestureDetector(
                          onTap: () => _updateBalance(value),
                          child: Center(
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: constraints.maxWidth * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                // "Send" button at the bottom
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF026A75),
                      padding: EdgeInsets.symmetric(
                        vertical: constraints.maxWidth * 0.04,
                        horizontal: constraints.maxWidth * 0.2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      // Action when Send button is pressed
                      print('Balance to send: $_balance');
                    },
                    child: Text(
                      'Send',
                      style: TextStyle(
                        fontSize: constraints.maxWidth * 0.05,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
