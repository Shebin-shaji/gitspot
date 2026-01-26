import 'package:flutter/material.dart';
import 'package:git_spot/view/features/trending/widget/trending_developer_card.dart';
import 'package:git_spot/view/features/trending/widget/trending_repo_card.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_app_bar.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const CustomPrimaryAppBar(title: "GitHub Trendings"),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: "Repos"),
                Tab(text: "Developers"),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  // Repos Page (Scrollable)
                  ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      TrendingRepoCard(
                        repoName: "flutter",
                        description:
                            "Flutter makes it easy and fast to build apps for any screen.",
                        ownerUsername: "flutter",
                        ownerAvatarUrl:
                            "https://avatars.githubusercontent.com/u/14101776?v=4",
                        stars: 162000,
                        forks: 27000,
                        language: "Dart",
                        isTrending: true,
                        onOpenRepo: () {
                          // open repo link
                        },
                      ),

                      const SizedBox(height: 16),

                      TrendingRepoCard(
                        repoName: "react",
                        description:
                            "A declarative, efficient, and flexible JavaScript library.",
                        ownerUsername: "facebook",
                        ownerAvatarUrl:
                            "https://avatars.githubusercontent.com/u/69631?v=4",
                        stars: 220000,
                        forks: 46000,
                        language: "JavaScript",
                        isTrending: true,
                        onOpenRepo: () {},
                      ),
                    ],
                  ),

                  // Developers Page (Scrollable)
                  ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      TrendingDeveloperCard(
                        username: "torvalds",
                        name: "Linus Torvalds",
                        avatarUrl:
                            "https://avatars.githubusercontent.com/u/1024025?v=4",
                        bio: "Creator of Linux and Git.",
                        totalStars: 150000,
                        publicRepos: 6,
                        primaryLanguage: "C",
                        onOpenProfile: () {
                          // open profile link
                        },
                      ),

                      const SizedBox(height: 16),

                      TrendingDeveloperCard(
                        username: "gaearon",
                        name: "Dan Abramov",
                        avatarUrl:
                            "https://avatars.githubusercontent.com/u/810438?v=4",
                        bio: "Working on React. Co-author of Redux.",
                        totalStars: 98000,
                        publicRepos: 260,
                        primaryLanguage: "TypeScript",
                        onOpenProfile: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
