import 'package:flutter/material.dart';
import 'package:git_spot/view/features/home/widgets/friend_list_tile.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_app_bar.dart';
import 'package:git_spot/view/shared/widgets/custom_tab_bar_view.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomPrimaryAppBar(title: "Shebin's Friends"),
      body: CustomTabBarView(
        tabTitles: const ["Following", "Followers"],
        children: [
          // Following List
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const FriendListTile(
                name: "Shebin Shaji",
                followersCount: "51",
                avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4",
              ),
              const SizedBox(height: 16),
              const FriendListTile(
                name: "Google",
                followersCount: "20k",
                avatarUrl:
                    "https://avatars.githubusercontent.com/u/1342004?v=4",
              ),
            ],
          ),

          // Followers List
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const FriendListTile(
                name: "Shebin Shaji",
                followersCount: "51",
                avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4",
              ),
              const SizedBox(height: 16),
              const FriendListTile(
                name: "Flutter",
                followersCount: "135k",
                avatarUrl:
                    "https://avatars.githubusercontent.com/u/14101776?v=4",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
