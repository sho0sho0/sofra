import 'package:flutter/material.dart';
import 'package:sofra_app/main.dart';

@override
Size get preferredSize {
  double appBarHeight = 90;
  return Size.fromHeight(appBarHeight);
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<CardModel> cards = [
    CardModel(
        name: "Mrh Raju", cardNumber: "5254 **** **** 7690", balance: 3763.87),
    CardModel(
        name: "Mrh Raju", cardNumber: "5254 **** **** 7690", balance: 3763.87),
    CardModel(
        name: "Mrh Raju", cardNumber: "5254 **** **** 7690", balance: 3763.87),
    CardModel(
        name: "Mrh Raju", cardNumber: "5254 **** **** 7690", balance: 3763.87),
  ];
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // Safe Area top inset (status bar height) to adjust space from top
    double safeTopPadding = MediaQuery.of(context).padding.top;

    // Adjusting dynamic values based on screen size
    double appBarPadding = screenWidth * 0.03; // 4% of screen width for padding
    double iconSize = screenWidth * 0.06; // Icon size relative to screen width

    // The total padding above the app bar to keep it consistent and responsive
    double topPadding = safeTopPadding +
        appBarPadding; // Adding safe top padding to the general padding

    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(preferredSize.height),
        child: Padding(
          padding: EdgeInsets.only(
            top: topPadding,
            left: appBarPadding,
            right: appBarPadding,
          ),
          child: Stack(
            children: [
              Positioned(
                top: screenHeight * 0.015,
                left: screenWidth * 0.02,
                child: CircleAvatar(
                  backgroundColor: const Color(0xffff5f6fa),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: iconSize,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.02,
                right: screenWidth * 0.00156,
                left: screenWidth * 0.00156,
                child: Center(
                  child: Text(
                    "Payment",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: screenHeight * 0.3125,
                    child: cards.length > 1
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cards.length,
                            itemBuilder: (context, index) {
                              return CreditCard(cards[index]);
                            },
                          )
                        : Center(
                            child: CreditCard(cards[0]),
                          ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.3203125,
                    left: screenWidth * 0.0444,
                    right: screenWidth * 0.0444,
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainBackgroundColor,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.0203,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                            color: Color(0xFF026A75), width: 1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add_box_rounded,
                          color: Color(0xFF026A75),
                        ),
                        Text(
                          ' Add new card',
                          style: TextStyle(
                            fontSize: screenWidth * 0.041666,
                            color: const Color(0xFF026A75),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.421875,
                    left: screenWidth * 0.0444,
                  ),
                  child: Text(
                    'Card Owner',
                    style: TextStyle(
                        fontSize: screenWidth * 0.041666,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.4625,
                    left: screenWidth * 0.0444,
                    right: screenWidth * 0.0444,
                  ),
                  child: TextField(
                    cursorHeight: screenHeight * 0.0234,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffff5f6fa),
                      hintText: 'Enter your card name here...',
                      hintStyle: TextStyle(
                          color: const Color(0xfff8f959e),
                          fontSize: screenWidth * 0.0333),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.0222),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.55625,
                    left: screenWidth * 0.0444,
                  ),
                  child: Text(
                    'Card Number',
                    style: TextStyle(
                        fontSize: screenWidth * 0.041666,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.596875,
                    left: screenWidth * 0.0444,
                    right: screenWidth * 0.0444,
                  ),
                  child: TextField(
                    cursorHeight: screenHeight * 0.0234,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffff5f6fa),
                      hintText: 'Enter your card number here...',
                      hintStyle: TextStyle(
                          color: const Color(0xfff8f959e),
                          fontSize: screenWidth * 0.0333),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.0222),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.690625,
                    left: screenWidth * 0.0444,
                  ),
                  child: Text(
                    'EXP',
                    style: TextStyle(
                        fontSize: screenWidth * 0.041666,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.73125,
                    left: screenWidth * 0.0444,
                  ),
                  child: SizedBox(
                    width: screenWidth * 0.4333,
                    child: TextField(
                      cursorHeight: screenHeight * 0.0234,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffff5f6fa),
                        hintText: 'Enter your EXP here...',
                        hintStyle: TextStyle(
                            color: const Color(0xfff8f959e),
                            fontSize: screenWidth * 0.0333),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.0222),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.690625,
                    left: screenWidth * 0.52777,
                  ),
                  child: Text(
                    'CVV',
                    style: TextStyle(
                        fontSize: screenWidth * 0.041666,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.73125,
                    left: screenWidth * 0.5222,
                  ),
                  child: SizedBox(
                    width: screenWidth * 0.4333,
                    child: TextField(
                      cursorHeight: screenHeight * 0.0234,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffff5f6fa),
                        hintText: 'Enter your CVV here...',
                        hintStyle: TextStyle(
                            color: const Color(0xfff8f959e),
                            fontSize: screenWidth * 0.0333),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.0222),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.84375, left: screenWidth * 0.0444),
                  child: Text(
                    'Save card info',
                    style: TextStyle(
                        fontSize: screenWidth * 0.036111,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.825,
                      right: screenWidth * 0.0444,
                    ),
                    child: Transform.scale(
                      scale: 0.7,
                      child: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeColor:
                            Colors.white, // White circle (thumb) when ON
                        activeTrackColor:
                            Colors.green, // Green background when ON
                        inactiveThumbColor:
                            Colors.white, // White circle (thumb) when OFF
                        inactiveTrackColor:
                            Colors.grey, // Gray background when OFF
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.90625,
                    left: screenWidth * 0.0444,
                    right: screenWidth * 0.0444,
                    bottom: screenHeight * 0.0375,
                  ),
                  child: SizedBox(
                    width: screenWidth * 0.9111,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF026A75),
                        foregroundColor: const Color(0xFFF9FAFA),
                        elevation: 0,
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.0203,
                        ),
                      ),
                      child: Text(
                        'Save Card',
                        style: TextStyle(
                            fontSize: screenWidth * 0.041666,
                            color: const Color(0xFFFFFFFF)),
                      ),
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

class CardModel {
  final String name; // The cardholder's name
  final String
      cardNumber; // The card number (as a string to accommodate the full number format)
  final double balance; // The available balance on the card

  // Constructor to initialize the CardModel
  CardModel({
    required this.name, // Cardholder's name must be provided
    required this.cardNumber, // Card number must be provided
    required this.balance, // Balance must be provided
  });
}

class CreditCard extends StatelessWidget {
  final CardModel card;
  const CreditCard(this.card, {super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10), // Rounded corners for card
      child: Container(
        width: screenWidth * 0.8333, // Responsive width based on screen width
        margin: EdgeInsets.only(
          left: screenWidth * 0.025, // Left margin for spacing
          right: screenWidth * 0.025, // Right margin for spacing
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("assets/visa.png"), // Background image of the card
            fit: BoxFit.fill, // Fill the card container with the image
          ),
        ),
        padding:
            EdgeInsets.all(screenWidth * 0.05555), // Padding inside the card
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align content to the start
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          children: [
            // Name of the cardholder
            Text(card.name,
                style: TextStyle(
                    fontSize: screenWidth * 0.047222, // Responsive font size
                    color: Colors.white, // White text color for contrast
                    fontWeight: FontWeight.w500)), // Medium weight
            SizedBox(height: screenHeight * 0.0495), // Space between elements
            // Card type (Visa Classic)
            Text("Visa Classic",
                style: TextStyle(
                    fontSize: screenWidth *
                        0.03888, // Smaller font size for card type
                    color: Colors.white,
                    fontWeight: FontWeight.w400)), // Regular weight
            SizedBox(height: screenHeight * 0.01089), // Space between elements
            // Card number with letter spacing for clarity
            Text(card.cardNumber,
                style: TextStyle(
                    fontSize: screenWidth * 0.041666, // Responsive font size
                    color: Colors.white,
                    letterSpacing: 6, // Extra spacing between digits
                    fontWeight: FontWeight.w300)), // Light weight
            SizedBox(height: screenHeight * 0.011739), // Space between elements
            // Card balance with a larger font for emphasis
            Text("\$${card.balance.toStringAsFixed(2)}",
                style: TextStyle(
                    fontSize:
                        screenWidth * 0.05, // Larger font size for balance
                    color: Colors.white,
                    fontWeight: FontWeight.bold)), // Bold weight for emphasis
          ],
        ),
      ),
    );
  }
}
