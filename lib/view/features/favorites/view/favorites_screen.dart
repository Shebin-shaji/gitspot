import 'package:flutter/material.dart';
import 'package:git_spot/view/features/favorites/widgets/favorite_list_tile.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_app_bar.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomPrimaryAppBar(title: "Favorites"),
      body: Padding(
        padding: .symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 32),
            FavoriteListTile(
              name: "Shebin Shaji",
              username: "shebin-shaji",
              imageUrl: "https://avatars.githubusercontent.com/u/1?v=4",
              onShare: () {},
              onDelete: () {},
            ),
          ],
        ),
      ),
    );
  }
}
