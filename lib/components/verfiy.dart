import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// This widget is the main entry point of the Email Verification screen.
class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  // Create 4 TextEditingControllers, each for one digit of the OTP
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());

  // Method to handle number button taps on the custom keyboard
  void _onKeyboardTap(String value) {
    for (var controller in _controllers) {
      // Find the first empty box and fill it with the tapped value
      if (controller.text.isEmpty) {
        controller.text = value;
        break;
      }
    }
  }

  // Method to clear the last filled box when backspace is pressed
  void _clearLast() {
    for (int i = _controllers.length - 1; i >= 0; i--) {
      if (_controllers[i].text.isNotEmpty) {
        _controllers[i].clear();
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background to white
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start (left)
        children: [
          const SizedBox(height: 60), // Spacing from top
          const Text(
            "Email verification,",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Please type OTP code that we give you",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 50),

          // Display the 4 OTP boxes in a row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              4,
              (index) => _buildOTPBox(context, _controllers[index]),
            ),
          ),

          const SizedBox(height: 10),

          // Resend timer row
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                "Resend on ",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                "02:39", // Placeholder countdown timer
                style: TextStyle(fontSize: 16, color: Color(0xFF026A75)),
              ),
            ],
          ),

          const Spacer(), // Push the keyboard to the bottom

          // Custom numeric keyboard
          Expanded(
            child: _buildCustomKeyboard(),
          ),
        ],
      ),
    );
  }

  // Widget to build a single OTP input box
  Widget _buildOTPBox(BuildContext context, TextEditingController controller) {
    return SizedBox(
      width: 60,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        readOnly: true, // Prevent native keyboard
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF0F3F6), // Light grey background
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Widget to build the custom keyboard UI
  Widget _buildCustomKeyboard() {
    return Container(
      color: Colors.grey[300], // Light grey background for the keyboard
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          // First row of the keyboard
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ["1", "2", "3"].map(_buildKeyboardButton).toList(),
          ),
          const SizedBox(height: 10),
          // Second row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ["4", "5", "6"].map(_buildKeyboardButton).toList(),
          ),
          const SizedBox(height: 10),
          // Third row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ["7", "8", "9"].map(_buildKeyboardButton).toList(),
          ),
          const SizedBox(height: 10),
          // Last row: Empty space | 0 | Backspace
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 60), // Placeholder for spacing
              _buildKeyboardButton("0"),
              IconButton(
                onPressed: _clearLast,
                icon: const Icon(Icons.backspace), // Backspace icon
                iconSize: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget to create a single custom keyboard button
  Widget _buildKeyboardButton(String value) {
    return ElevatedButton(
      onPressed: () => _onKeyboardTap(value), // Fill the next OTP box
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(85, 46),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: const Color(0xFFF0F3F6), // Light grey color
      ),
      child: Text(
        value,
        style: const TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
  }
}

// Main function to run the app
void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmailVerificationScreen(),
    ));
