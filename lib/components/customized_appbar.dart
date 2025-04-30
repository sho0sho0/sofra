import 'package:flutter/material.dart';
import 'package:sofra_app/main.dart';

class CustomizedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isThereLeadingIcon;
  final bool isThereTitle;
  final Color appbarColor;
  final Color iconBackgroundColor;

  const CustomizedAppBar({
    super.key,
    required this.title,
    required this.isThereLeadingIcon,
    required this.isThereTitle,
    required this.appbarColor,
    required this.iconBackgroundColor,
  });

  @override
  Size get preferredSize {
    // Adjusting the height of the app bar dynamically based on screen height
    double appBarHeight = 90;
    return Size.fromHeight(appBarHeight);
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    // Safe Area top inset (status bar height) to adjust space from top
    double safeTopPadding = MediaQuery.of(context).padding.top;

    // Adjusting dynamic values based on screen size
    double appBarPadding = screenWidth * 0.03; // 4% of screen width for padding
    double iconSize = screenWidth * 0.06; // Icon size relative to screen width
    double fontSize = screenWidth * 0.05; // Font size relative to screen width

    // Responsive left padding for the text
    double textLeftPadding =
        screenWidth * 0.1; // 10% of screen width for padding

    // The total padding above the app bar to keep it consistent and responsive
    double topPadding = safeTopPadding +
        appBarPadding; // Adding safe top padding to the general padding

    return PreferredSize(
      preferredSize: Size.fromHeight(preferredSize.height),
      child: Padding(
        padding: EdgeInsets.only(
            top: topPadding, left: appBarPadding, right: appBarPadding),
        child: Container(
          decoration: BoxDecoration(
            color: appbarColor,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (isThereLeadingIcon)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: appBarPadding / 2,
                        top: appBarPadding,
                        right: appBarPadding / 2,
                        bottom: appBarPadding,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xfffeaecf0)),
                          borderRadius: BorderRadius.circular(16.0),
                          color: iconBackgroundColor),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        color: Colors.black,
                        iconSize: iconSize,
                      ),
                    ),
                  ],
                ),
              if (isThereTitle)
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: textLeftPadding),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
