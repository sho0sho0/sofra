import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sofra_app/screens/add_new_card.dart';
import 'package:sofra_app/screens/address_screen.dart';
import 'package:sofra_app/screens/all_categories_screen.dart';
import 'package:sofra_app/screens/chats_screen.dart';
import 'package:sofra_app/screens/confirmed_screen.dart';
import 'package:sofra_app/screens/location_screen.dart';
import 'package:sofra_app/screens/meals_screen.dart';
import 'package:sofra_app/screens/onboarding_screens.dart';
import 'package:sofra_app/screens/payment_screen.dart';
import 'package:sofra_app/screens/rating_screen.dart';
import 'package:sofra_app/screens/restaurant_information_screen.dart';
import 'package:sofra_app/screens/restaurant_screen.dart';
import 'package:sofra_app/screens/reviews_screen.dart';
import 'package:sofra_app/screens/search_screen.dart';
import 'package:sofra_app/screens/shop_screen.dart';
import 'package:sofra_app/screens/wallet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrepScreen(),
    );
  }
}

class PrepScreen extends StatelessWidget {
  const PrepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prep Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Button color
            padding: const EdgeInsets.symmetric(
                vertical: 16.0, horizontal: 32.0), // Padding
            textStyle: const TextStyle(fontSize: 18), // Text style
          ),
          child: const Text("Go to Screen"),
        ),
      ),
    );
  }
}

final Color mainBackgroundColor = Colors.white;
final Color primaryColor = Color(0xFF026A75); // Main theme color
