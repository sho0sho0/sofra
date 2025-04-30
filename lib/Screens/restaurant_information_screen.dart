import 'package:flutter/material.dart';
import 'package:sofra_app/components/customized_appbar.dart';
import 'package:sofra_app/main.dart';
import 'package:url_launcher/url_launcher.dart';

// Stateless widget for the Restaurant Information Screen
class RestaurantInformationScreen extends StatelessWidget {
  const RestaurantInformationScreen({Key? key}) : super(key: key);

  // Method to launch the phone dialer with a given phone number
  void _launchPhoneDialer(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneNumber'; // Throw error if launching fails
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions to make the design responsive
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomizedAppBar(
        title: 'Restaurant Information',
        isThereLeadingIcon: true, // Enable back button
        isThereTitle: true, // Show title
        appbarColor: Colors.transparent,
        iconBackgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth *
              0.0444, // Horizontal padding responsive to screen size
          vertical: screenHeight *
              0.0125, // Vertical padding responsive to screen size
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Restaurant Location Map Image
            ClipRRect(
              borderRadius: BorderRadius.circular(screenWidth * 0.0333),
              child: Image.asset(
                'assets/map_placeholder.png',
                height: screenHeight * 0.2343,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: screenHeight * 0.01875),

            // Location Row with Icon and Address
            Row(
              children: [
                Icon(Icons.location_pin, color: Colors.black),
                SizedBox(width: screenWidth * 0.0222),
                Text(
                  'NYC, Broadway ave 79',
                  style: TextStyle(fontSize: screenWidth * 0.0444),
                ),
              ],
            ),

            // Divider to separate sections
            Divider(height: screenHeight * 0.046875),

            // About Us Section Title
            Text(
              'About us',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.0125),

            // About Us Description with "See more" link
            Wrap(
              children: [
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad. ',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03888,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: Implement navigation to full description page
                  },
                  child: Text(
                    'See more...',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03888,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),

            // Divider between sections
            Divider(height: screenHeight * 0.0468),

            // Working hours for weekdays
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Monday-Friday', style: TextStyle(fontSize: 16)),
                Text(
                  ':  10:00 - 22.00',
                  style: TextStyle(
                    fontSize: screenWidth * 0.0444,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Working hours for weekends
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Saturday-Sunday',
                  style: TextStyle(fontSize: screenWidth * 0.0444),
                ),
                Text(
                  ':  12:00 - 20.00',
                  style: TextStyle(
                    fontSize: screenWidth * 0.0444,
                    color: primaryColor,
                  ),
                ),
              ],
            ),

            // Divider between sections
            Divider(height: screenHeight * 0.0468),

            // Phone Number Section
            Row(
              children: [
                Text(
                  'Phone number',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(flex: 1),
                GestureDetector(
                  // Tapping the number will launch the phone dialer
                  onTap: () => _launchPhoneDialer('056056591'),
                  child: Text(
                    '056056591',
                    style: TextStyle(
                      fontSize: screenWidth * 0.0444,
                      color: primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
