import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get current theme (light/dark)

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,

      // Background comes from theme
      backgroundColor: theme.scaffoldBackgroundColor,

      // Selected icon/text color comes from theme's primary color
      selectedItemColor: theme.colorScheme.primary,

      // Unselected color: slightly dimmed, calculated from text color
      unselectedItemColor: theme.textTheme.bodyMedium?.color?.withOpacity(0.6),

      selectedLabelStyle: theme.textTheme.bodyMedium, // Outfit font applied
      unselectedLabelStyle: theme.textTheme.bodyMedium, // Outfit font applied

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Repos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.trending_up),
          label: 'Trending',
        ),
      ],
    );
  }
}
