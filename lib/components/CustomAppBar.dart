import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isFavorite;
  final Function(bool) onFavoriteToggle;

  const CustomAppBar({
    Key? key,
    required this.isFavorite,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 70,
        ),
        Positioned(
          top: 10,
          left: 10,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? const Color(0xFF026A75) : Colors.grey,
              ),
              onPressed: () => onFavoriteToggle(!isFavorite),
            ),
          ),
        ),
      ],
    );
  }
}
