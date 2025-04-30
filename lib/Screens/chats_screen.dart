import 'package:flutter/material.dart';
import 'package:sofra_app/components/customized_bottom_navigationbar.dart';
import 'package:sofra_app/main.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  bool isMessageSelected =
      true; // Tracks which tab (Message or Notification) is selected

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery for responsive design
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header with the Message and Notification tabs
          Container(
            width: double.infinity,
            height: screenHeight * 0.15, // Height of the header container
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Color(0xffff0f3f6),
                    width: 2), // Border at the bottom
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.03125,
                  bottom: screenHeight * 0.0078), // Padding for header content
              child: Row(
                children: [
                  const Spacer(), // Spacer to center the tabs
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMessageSelected = true; // Switch to "Message" tab
                      });
                    },
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Centering the content
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenHeight *
                                  0.0125), // Padding above the text
                          child: Text(
                            'Message', // Tab name
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // Bold text
                              color: isMessageSelected
                                  ? primaryColor // Color for the selected tab
                                  : const Color(
                                      0xfff979797), // Color for unselected tab
                            ),
                          ),
                        ),
                        if (isMessageSelected)
                          Container(
                            margin: EdgeInsets.only(
                                top: screenHeight *
                                    0.00625), // Margin for the line under the selected tab
                            height:
                                screenHeight * 0.00625, // Height of the line
                            width: screenWidth * 0.0111, // Width of the line
                            decoration: BoxDecoration(
                              color:
                                  primaryColor, // Line color for the active tab
                              borderRadius: BorderRadius.circular(
                                  2), // Rounded corners for the line
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMessageSelected =
                            false; // Switch to "Notification" tab
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.0125),
                          child: Text(
                            'Notification', // Tab name for Notification
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: !isMessageSelected
                                  ? primaryColor // Color for selected Notification tab
                                  : const Color(
                                      0xfff979797), // Color for unselected tab
                            ),
                          ),
                        ),
                        if (!isMessageSelected)
                          Container(
                            margin:
                                EdgeInsets.only(top: screenHeight * 0.00625),
                            height: screenHeight * 0.00625,
                            width: screenWidth * 0.0111,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),

          // Search Bar Widget
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.025),
            child: const SearchBar(),
          ),

          // Conditional rendering of message or notification list
          Expanded(
            child:
                isMessageSelected ? _buildChatList() : _buildNotificationList(),
          ),
        ],
      ),
      // Custom bottom navigation bar at the bottom of the screen
      bottomNavigationBar: const CustomizedBottomNavigationBar(),
    );
  }

  // Method to build the list of chats
  Widget _buildChatList() {
    // Get screen dimensions for responsive design
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // List of chats to display
    List<ChatsData> chats = [
      ChatsData(
        image: 'chats1.png',
        name: 'Plush Beauty Lounge',
        lastMessage: 'Good morning, anything we ca...',
        unreadCount: 2, // Number of unread messages
        time: '11.32 PM',
        screenName: const SofraScreen(), // Screen to navigate to
      ),
      ChatsData(
        image: 'chats2.png',
        name: 'Lovely Lather',
        lastMessage: 'Good morning, anything we ca...',
        unreadCount: 2,
        time: '11.32 PM',
        screenName: const SofraScreen(),
      ),
      // More chat items...
    ];

    // ListView.builder to display chats
    return ListView.separated(
      padding: EdgeInsets.all(screenHeight * 0.00625), // Padding for the list
      itemCount: chats.length, // Number of items in the list
      itemBuilder: (context, index) {
        final chat = chats[index]; // Accessing individual chat item
        return GestureDetector(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/${chat.image}'), // Profile image
            ),
            title: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.00937),
              child: Text(
                chat.name, // Displaying the chat name
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.04166),
              ),
            ),
            subtitle: Text(
              chat.lastMessage, // Displaying the last message
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: const Color(0xfff50555c),
                  fontSize: screenWidth * 0.0333),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat.time, // Displaying the time
                  style: TextStyle(
                    color: const Color(0xfffadb3bc),
                    fontSize: screenWidth * 0.02777,
                  ),
                ),
                if (chat.unreadCount > 0)
                  SizedBox(
                      height: screenHeight *
                          0.00625), // Adds spacing between time and circle
                if (chat.unreadCount > 0)
                  CircleAvatar(
                    radius: 9, // Size of the unread message circle
                    backgroundColor: const Color(0xffffe724c), // Circle color
                    child: Text(
                      '${chat.unreadCount}', // Number of unread messages
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.0333,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Navigating to a specific screen when a chat is tapped
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SofraScreen()),
            );
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: const Color(0xFFF0F3F6),
          thickness: 1,
          height: screenHeight * 0.025, // Adjust the height between items
          endIndent: screenWidth * 0.08333,
          indent: screenWidth * 0.08333,
        );
      },
    );
  }

  // Placeholder method for notifications
  Widget _buildNotificationList() {
    return const Center(
      child: Text(
        'No notifications available', // Placeholder text for notifications
        style: TextStyle(color: Color(0xff979797), fontSize: 16),
      ),
    );
  }
}

class ChatsData {
  String image; // The URL or asset path of the user's profile image
  String name; // The name of the contact or chat participant
  String lastMessage; // The last message sent in the chat
  int unreadCount; // The number of unread messages
  String time; // The time when the last message was sent
  Widget
      screenName; // A widget representing the screen name, can be used for navigation or other purposes

  // Constructor to initialize all the fields of the ChatsData class
  ChatsData({
    required this.image, // Required parameter for image (profile picture)
    required this.name, // Required parameter for name
    required this.lastMessage, // Required parameter for the last message
    required this.unreadCount, // Required parameter for unread messages count
    required this.time, // Required parameter for the time of the last message
    required this.screenName, // Required parameter for the screen name widget
  });
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final List<bool> _selectedSuggestions = List.generate(8, (index) => false);
  final List<bool> _selectedDistance = List.generate(3, (index) => false);
  String? _selectedSortOption; // To track the selected sort option

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Get screen width
    double screenHeight =
        MediaQuery.of(context).size.height; // Get screen height

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.006), // Padding around the SearchBar
      child: SizedBox(
        height: screenHeight * 0.069, // Set the height of the search bar
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search...', // Placeholder text inside the search bar
            hintStyle: TextStyle(
              color: const Color(
                  0xfffadb3bc), // Light grey color for the hint text
              fontSize: screenHeight * 0.02, // Font size based on screen height
              fontWeight: FontWeight.w400, // Set the font weight to normal
            ),
            prefixIcon: Icon(
              Icons.search, // Search icon to the left inside the search bar
              color: const Color(0xfff156778), // Icon color
              size: screenHeight * 0.03, // Icon size based on screen height
            ),
            filled: true, // Fill the background of the search bar with color
            fillColor:
                const Color(0xffff0f3f6), // Background color of the search bar
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  30), // Rounded corners for the search bar
              borderSide: const BorderSide(
                  color: Color(
                      0xffff0f3f6)), // Border color matching the background
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(30), // Rounded corners when enabled
              borderSide: const BorderSide(
                  color: Color(
                      0xffff0f3f6)), // Border color when the search bar is enabled
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(30), // Rounded corners when focused
              borderSide: const BorderSide(
                  color: Color(
                      0xffff0f3f6)), // Border color when the search bar is focused
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01,
                horizontal:
                    screenWidth * 0.04), // Padding inside the search bar
          ),
        ),
      ),
    );
  }
}

class SofraScreen extends StatelessWidget {
  const SofraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery to make the layout responsive
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: AppBar(
        backgroundColor: Colors.white, // White background for the app bar
        elevation: 0, // Remove shadow/elevation from the app bar
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded, // Back icon for navigation
            color: const Color(0xfff026a75), // Custom color for the icon
            size: screenWidth * 0.0555, // Icon size based on screen width
          ),
          onPressed: () {
            Navigator.pop(context); // Pop the screen to go back
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Align title to the left
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/sofra.png'), // Profile image
            ),
            SizedBox(
                width: screenWidth * 0.0277), // Space between avatar and text
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the left
              children: [
                Text(
                  "Sofra App",
                  style: TextStyle(
                      fontSize:
                          screenWidth * 0.05, // Font size based on screen width
                      color: Colors.black, // Text color black
                      fontWeight: FontWeight.bold), // Bold font weight
                ),
                Text(
                  "Online",
                  style: TextStyle(
                    fontSize:
                        screenWidth * 0.033, // Font size for "Online" label
                    color: const Color(
                        0xfff026a75), // Custom color for "Online" text
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.call, // Call icon
            color: const Color(0xfff026a75), // Custom color for the icon
            size: screenWidth * 0.0555, // Icon size based on screen width
          ),
          SizedBox(width: screenWidth * 0.02777), // Space between icons
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.025, // Top padding for the icon
              bottom: screenHeight * 0.025, // Bottom padding for the icon
              right: screenWidth * 0.0444, // Right padding for the icon
              left: screenWidth * 0.0222, // Left padding for the icon
            ),
            child: Icon(
              Icons.more_vert, // More options icon
              color: const Color(0xfff026a75), // Custom color for the icon
              size: screenWidth * 0.0555, // Icon size based on screen width
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: screenHeight * 0.025), // Top padding for the body
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  // List of chat bubbles
                  ChatBubble(
                    text:
                        "Good morning, anything we can help at Plush Beauty Longue Salon?",
                    isSender: false, // Receiver message
                  ),
                  ChatBubble(
                    text:
                        "This looks awesome 😍", // Sender message with an emoji
                    isSender: true, // Sender message
                    hasImage: true, // Message contains an image
                    imageUrl:
                        'assets/sofra.png', // Image for the message bubble
                  ),
                  ChatBubble(
                    text:
                        "I would like to book an appointment at 2:30 PM today.",
                    isSender: true, // Sender message
                  ),
                ],
              ),
            ),
            const ChatInputField(), // Chat input field at the bottom
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text; // Message text
  final bool isSender; // Determines if the message is sent by the user
  final bool hasImage; // Whether the bubble contains an image
  final String? imageUrl; // URL for the image (optional)

  const ChatBubble({
    super.key,
    required this.text,
    required this.isSender,
    this.hasImage = false,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery to make the layout responsive
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical:
              screenHeight * 0.0078), // Vertical padding around the bubble
      child: Column(
        crossAxisAlignment: isSender
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start, // Align bubble based on sender
        children: [
          // Chat bubble container
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth:
                    screenWidth * 0.694), // Limit the max width of the bubble
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: screenWidth *
                      0.0277), // Horizontal margin around the bubble
              padding: EdgeInsets.all(
                  screenHeight * 0.01875), // Padding inside the bubble
              decoration: BoxDecoration(
                color: isSender
                    ? const Color(0xFFE1F5FA) // Light blue for sender
                    : const Color(0xFF156778), // Dark blue for receiver
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(15), // Rounded top left corner
                  topRight:
                      const Radius.circular(15), // Rounded top right corner
                  bottomLeft: isSender
                      ? const Radius.circular(15)
                      : Radius.zero, // Bottom-left corner rounded if sender
                  bottomRight: isSender
                      ? Radius.zero
                      : const Radius.circular(
                          15), // Bottom-right corner rounded if receiver
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Align the text within the bubble to the left
                children: [
                  if (hasImage && imageUrl != null) // Show image if available
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: screenHeight *
                              0.0125), // Space between image and text
                      child: Image.asset(imageUrl!), // Display the image
                    ),
                  Text(
                    text, // Display the message text
                    style: TextStyle(
                      color: isSender
                          ? Colors.black
                          : Colors.white, // Text color based on sender
                      fontSize: screenWidth *
                          0.0388, // Font size based on screen width
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Time text outside the bubble
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.0222, // Left padding for the time text
              right: screenWidth * 0.0222, // Right padding for the time text
              top: screenHeight * 0.00625, // Top padding for the time text
            ),
            child: Row(
              mainAxisSize: MainAxisSize
                  .min, // Minimize the row to just the time and icon
              children: [
                Text(
                  "11:20 PM", // Static time (could be dynamic in future)
                  style: TextStyle(
                    color: Colors.grey, // Text color for the time (gray)
                    fontSize:
                        screenWidth * 0.0333, // Smaller font size for the time
                  ),
                ),
                SizedBox(
                    width: screenWidth *
                        0.01388), // Space between time and seen icon
                if (isSender) // Show "seen" icon if the message is from the sender
                  Image.asset(
                    'assets/seen.png', // Asset for the seen icon
                    width: screenWidth *
                        0.03055, // Icon width based on screen width
                    height: screenHeight *
                        0.0171, // Icon height based on screen height
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery to make the layout responsive
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white, // Background color of the container
        border: Border(
          top: BorderSide(
            color: Color(0xFFF0F3F6), // Upper border color
            width: 1.0, // Border width
          ),
        ),
      ),
      padding: EdgeInsets.only(
        bottom: screenHeight *
            0.0368, // Padding for the bottom based on screen height
        top: screenHeight * 0.025, // Padding for the top based on screen height
        right:
            screenWidth * 0.0444, // Padding for the right based on screen width
        left:
            screenWidth * 0.0444, // Padding for the left based on screen width
      ),
      child: Row(
        children: [
          // Attachment button (icon)
          IconButton(
            onPressed: () {}, // Placeholder for the onPressed function
            icon: Transform.rotate(
                angle: -1, // Rotate the attachment icon slightly
                child: const Icon(Icons.attachment, color: Color(0xfffadb3bc))),
          ),
          // Text field for message input
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth *
                      0.0277), // Horizontal padding based on screen width
              decoration: BoxDecoration(
                color: const Color(
                    0xffff0f3f6), // Background color of the text field
                borderRadius:
                    BorderRadius.circular(30), // Circular text field corners
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type a message", // Placeholder text
                        hintStyle: TextStyle(
                            color: const Color(
                                0xfffadb3bc), // Placeholder text color
                            fontWeight:
                                FontWeight.w400, // Font weight for hint text
                            fontSize: screenWidth *
                                0.04166), // Font size based on screen width
                        border: InputBorder
                            .none, // Remove the default border of the text field
                      ),
                    ),
                  ),
                  // Emoji icon button next to the text field
                  IconButton(
                    onPressed: () {}, // Placeholder for the onPressed function
                    icon: Icon(
                      Icons.sentiment_satisfied_alt_outlined, // Emoji icon
                      color: const Color(0xfffadb3bc), // Icon color
                      size: screenWidth *
                          0.05833, // Icon size based on screen width
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Space between text field and send button
          SizedBox(
              width: screenWidth *
                  0.02777), // This creates a small gap between the input field and the send button
          // Send button (icon inside a circle)
          Container(
            width: screenWidth * 0.1194, // Button width based on screen width
            height:
                screenHeight * 0.0671, // Button height based on screen height
            decoration: const BoxDecoration(
              color: Color(0xFF156778), // Circle color for the button
              shape: BoxShape.circle, // Circular shape for the send button
            ),
            child: IconButton(
              onPressed: () {}, // Placeholder for the onPressed function
              icon: Transform.rotate(
                angle: -1, // Rotate the send icon slightly
                child: Icon(
                  Icons.send, // Send icon
                  color: Colors.white, // Icon color (white)
                  size: screenWidth * 0.0611, // Icon size based on screen width
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
