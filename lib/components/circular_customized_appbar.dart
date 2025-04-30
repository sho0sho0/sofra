  // import 'package:flutter/material.dart';

  // @override
  // Size get preferredSize {
  //   // Adjusting the height of the app bar dynamically based on screen height
  //   double appBarHeight = 90;
  //   return Size.fromHeight(appBarHeight);
  // }

  // @override
  // Widget build(BuildContext context) {
  //   // Get screen width and height using MediaQuery
  //   double screenHeight = MediaQuery.of(context).size.height;
  //   double screenWidth = MediaQuery.of(context).size.width;

  //   // Safe Area top inset (status bar height) to adjust space from top
  //   double safeTopPadding = MediaQuery.of(context).padding.top;

  //   // Adjusting dynamic values based on screen size
  //   double appBarPadding = screenWidth * 0.03; // 4% of screen width for padding
  //   double iconSize = screenWidth * 0.06; // Icon size relative to screen width

  //   // The total padding above the app bar to keep it consistent and responsive
  //   double topPadding = safeTopPadding +
  //       appBarPadding; // Adding safe top padding to the general padding

  //   return Scaffold(
  //     appBar: PreferredSize(
  //       preferredSize: Size.fromHeight(preferredSize.height),
  //       child: Padding(
  //         padding: EdgeInsets.only(
  //             top: topPadding, left: appBarPadding, right: appBarPadding),
  //         child: Stack(
  //           children: [
  //             Positioned(
  //               top: screenHeight * 0.015,
  //               left: screenWidth * 0.02,
  //               child: CircleAvatar(
  //                 backgroundColor: Colors.white,
  //                 child: IconButton(
  //                   icon: Icon(
  //                     Icons.arrow_back,
  //                     color: Color(0xfff156778),
  //                     size: iconSize,
  //                   ),
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                 ),
  //               ),
  //             ),
  //             Positioned(
  //               top: screenHeight * 0.015,
  //               right: screenWidth * 0.02,
  //               child: CircleAvatar(
  //                 backgroundColor: Colors.white,
  //                 child: IconButton(
  //                   icon: SizedBox(
  //                     width: screenWidth * 0.05,
  //                     height: screenWidth * 0.05,
  //                     child: Image.asset(
  //                       'assets/Vector.png', // Path to your vector image
  //                       fit: BoxFit.contain,
  //                     ),
  //                   ),
  //                   onPressed: () {},
  //                 ),
  //               ),
  //             ),
  //             Positioned(
  //               top: screenHeight * 0.015,
  //               right: screenWidth * 0.18,
  //               child: CircleAvatar(
  //                 backgroundColor: Colors.white,
  //                 child: IconButton(
  //                   icon: Icon(
  //                     isFavorite
  //                         ? Icons.favorite
  //                         : Icons.favorite_border, // Toggle icon
  //                     color:
  //                         isFavorite ? Color(0xFFfED4C5C) : Color(0xFFfED4C5C),
  //                     size: iconSize, // Toggle color
  //                   ),
  //                   onPressed: () {
  //                     setState(() {
  //                       isFavorite = !isFavorite; // Toggle state
  //                     });
  //                   },
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),