import 'package:flutter/material.dart';
import 'package:git_spot/view/features/home/widgets/profile_list_tile.dart';
import 'package:git_spot/view/features/trending/widget/trending_developer_card.dart';
import 'package:git_spot/view/features/trending/widget/trending_repo_card.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_app_bar.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomPrimaryAppBar(title: "Shebin's Friends"),
      body: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: "Following"),
              Tab(text: "Followers"),
            ],
          ),

          Expanded(
            child: TabBarView(
              children: [
                // Repos Page (Scrollable)
                ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    ProfileListTile(
                      name: "Shebin Shaji",
                      username: "shebin-shaji",
                      imageUrl: "https://avatars.githubusercontent.com/u/1?v=4",
                      onShare: () {},
                      onDelete: () {},
                    ),
                  ],
                ),

                // Developers Page (Scrollable)
                ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                     ProfileListTile(
                      name: "Shebin Shaji",
                      username: "shebin-shaji",
                      imageUrl: "https://avatars.githubusercontent.com/u/1?v=4",
                      onShare: () {},
                      onDelete: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
