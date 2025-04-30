import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  _OnboardingScreensState createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final PageController _controller =
      PageController(); // Controller for PageView
  int _currentPage = 0; // To track the current page

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        // Updating the current page when the user scrolls
        _currentPage = _controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when not in use
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height; // Get screen height
    final screenWidth = MediaQuery.of(context).size.width; // Get screen width

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller, // PageController to control the pages
            children: [
              OnBoarding(
                num: 1,
                text1: 'Best Home-Cooked Meals', // Title text
                text2:
                    'Bringing the taste of home to\nyour table', // Subtitle text
                controller: _controller,
              ),
              OnBoarding(
                num: 2,
                text1: 'Meet Our Chefs',
                text2:
                    'Discover talented home chefs\ndelivering the finest homemade\nmeals',
                controller: _controller,
              ),
              OnBoarding(
                num: 3,
                text1: 'Discover Delicious Options',
                text2:
                    'Explore a variety of home-cooked meals\nprepared by skilled chefs',
                controller: _controller,
              ),
              OnBoarding4(
                num: 4,
                text1: 'Let’s Join with Us',
                text2:
                    'Discover and order authentic home-cooked meals anytime.',
                controller: _controller,
              ),
            ],
          ),
          if (_currentPage != 3) // Avoid showing indicator on last page
            Positioned(
              top: screenHeight *
                  0.74, // Position the page indicator near the bottom
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 4, // Total number of pages
                  effect: WormEffect(
                    dotWidth:
                        screenWidth * 0.025, // Dot size based on screen width
                    dotHeight: screenWidth * 0.025,
                    dotColor: const Color(0xFFF9FAFA), // Inactive dot color
                    activeDotColor: const Color(0xFF121F3E), // Active dot color
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class OnBoarding extends StatelessWidget {
  final int num; // Page number
  final String text1; // Title text
  final String text2; // Subtitle text
  final PageController controller; // PageController to navigate between pages

  const OnBoarding({
    super.key,
    required this.num,
    required this.controller,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height; // Get screen height
    final screenWidth = MediaQuery.of(context).size.width; // Get screen width

    return Scaffold(
      body: Stack(
        children: [
          CommonOnBoardingComp(
            t1: text1, // Title
            t2: text2, // Subtitle
            n: num, // Page number for background image
          ),
          Positioned(
            top: screenHeight * 0.79, // Positioning the button near the bottom
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: ElevatedButton(
              onPressed: () {
                controller.nextPage(
                  // Navigate to the next page
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF026A75),
                foregroundColor: const Color(0xFFF9FAFA),
                elevation: 0,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.015,
                ),
              ),
              child: const Text(
                'Next', // Button text
                style: TextStyle(fontSize: 15, color: Color(0xFFFFFFFF)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoarding4 extends StatelessWidget {
  final int num; // Page number
  final String text1; // Title text
  final String text2; // Subtitle text
  final PageController controller; // PageController to navigate between pages

  const OnBoarding4({
    super.key,
    required this.num,
    required this.text1,
    required this.text2,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height; // Get screen height
    final screenWidth = MediaQuery.of(context).size.width; // Get screen width

    return Scaffold(
      body: Stack(
        children: [
          CommonOnBoardingComp(t1: text1, t2: text2, n: num),
          Positioned(
            top: screenHeight * 0.72,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: ElevatedButton.icon(
              onPressed: () {}, // Action for Google login button
              icon: Image.asset(
                'assets/Google.png', // Google icon
                height: screenHeight * 0.03,
                width: screenWidth * 0.07,
              ),
              label: const Text(
                'Join with Google',
                style: TextStyle(fontSize: 15, color: Color(0xFF88A0A8)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFFFFF),
                elevation: 0,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.015,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.79,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: ElevatedButton.icon(
              onPressed: () {}, // Action for Email login button
              icon: const Icon(Icons.mail, color: Color(0xFFFFFFFF)),
              label: const Text(
                'Join with Email',
                style: TextStyle(fontSize: 15, color: Color(0xFFFFFFFF)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF026A75),
                elevation: 0,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.015,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommonOnBoardingComp extends StatelessWidget {
  final String t1; // Title text
  final String t2; // Subtitle text
  final int n; // Page number for background image

  const CommonOnBoardingComp({
    super.key,
    required this.t1,
    required this.t2,
    required this.n,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height; // Get screen height
    final screenWidth = MediaQuery.of(context).size.width; // Get screen width

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/Bg$n.png'), // Background image for each page
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.55, // Position title text
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: Center(
              child: Text(
                t1, // Display title text
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.62, // Position subtitle text
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: Center(
              child: Text(
                t2, // Display subtitle text
                style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.08, // Position sign-in link at the bottom
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
                InkWell(
                  onTap: () {}, // Action for sign-in link
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Color(0xFF121F3E)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
