import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:git_spot/view/features/splash/view/splash_screen.dart';
import 'package:git_spot/view/features/home/view/home_screen.dart';
import 'package:git_spot/view/features/repos/view/repos_screen.dart';
import 'package:git_spot/view/features/favorites/view/favorites_screen.dart';
import 'package:git_spot/view/features/trending/view/trending_screen.dart';
import 'package:git_spot/view/shared/widgets/bottom_nav_bar.dart';
import 'package:git_spot/view/features/home/view/user_repos.dart';
import 'package:git_spot/view/features/home/view/time_line_page.dart';
import 'package:git_spot/view/features/home/view/friends_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
            routes: [
              GoRoute(
                path: 'user-repos',
                builder: (context, state) => const UserRepos(),
              ),
              GoRoute(
                path: 'timeline',
                builder: (context, state) => const TimeLinePage(),
              ),
              GoRoute(
                path: 'friends',
                builder: (context, state) => const FriendsPage(),
              ),
            ],
          ),
          GoRoute(
            path: '/repos',
            builder: (context, state) => const ReposScreen(),
          ),
          GoRoute(
            path: '/favorites',
            builder: (context, state) => const FavoritesScreen(),
          ),
          GoRoute(
            path: '/trending',
            builder: (context, state) => const TrendingScreen(),
          ),
        ],
      ),
    ],
  );
});

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;
  const ScaffoldWithNavBar({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/repos')) return 1;
    if (location.startsWith('/favorites')) return 2;
    if (location.startsWith('/trending')) return 3;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/repos');
        break;
      case 2:
        GoRouter.of(context).go('/favorites');
        break;
      case 3:
        GoRouter.of(context).go('/trending');
        break;
    }
  }
}
