import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:git_spot/view/features/trending/view_model/trending_repos_view_model.dart';
import 'package:git_spot/view/features/trending/widget/trending_developer_card.dart';
import 'package:git_spot/view/features/trending/widget/trending_repo_card.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_app_bar.dart';
import 'package:git_spot/view/shared/widgets/custom_tab_bar_view.dart';

class TrendingScreen extends ConsumerWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingReposState = ref.watch(trendingReposViewModelProvider);

    return Scaffold(
      appBar: const CustomPrimaryAppBar(title: "GitHub Trendings"),
      body: CustomTabBarView(
        tabTitles: const ["Repos", "Developers"],
        children: [
          // Repos Page (Scrollable)
          trendingReposState.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: trendingReposState.trendingRepos.length,
                  itemBuilder: (context, index) {
                    final repo = trendingReposState.trendingRepos[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TrendingRepoCard(
                        repoModel: repo,
                        isTrending:
                            true, // we assume all from this list are trending
                        onOpenRepo: () {
                          // TODO: url launcher logic if needed, inside the card or here
                        },
                      ),
                    );
                  },
                ),

          // Developers Page (Scrollable)
          ListView(
            padding: const EdgeInsets.all(16),
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
                avatarUrl: "https://avatars.githubusercontent.com/u/810438?v=4",
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
    );
  }
}
