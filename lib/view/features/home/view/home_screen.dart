import 'package:flutter/material.dart';
import 'package:git_spot/view/features/favorites/view/favorites_screen.dart';
import 'package:git_spot/view/features/home/view/home_main_view.dart';
import 'package:git_spot/view/features/repos/view/repos_screen.dart';
import 'package:git_spot/view/features/trending/view/trending_screen.dart';
import 'package:git_spot/view/shared/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final screens = const [
    HomeMainView(),
    ReposScreen(),
    FavoritesScreen(),
    TrendingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
