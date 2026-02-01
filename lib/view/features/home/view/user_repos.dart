import 'package:flutter/material.dart';
import 'package:git_spot/view/features/repos/widgets/repo_card.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_app_bar.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_search_bar.dart';

class UserRepos extends StatelessWidget {
  const UserRepos({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomPrimaryAppBar(title: "Shebin's Repos"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 32),
                const CustomPrimaryTextField(labelText: "Search a Repo"),
                const SizedBox(height: 32),
                RepoCard(
                  repoName: "gitspot",
                  description:
                      "A modern GitHub profile and repository explorer built with Flutter.",
                  stars: 248,
                  downloads: 1200,
                  updatedAt: "3 days ago",
                  onShare: () {},
                  onOpen: () {},
                ),
                const SizedBox(height: 20),
                RepoCard(
                  repoName: "flutter_riverpod",
                  description:
                      "A reactive caching and data-binding framework. Riverpod makes working with asynchronous code a breeze.",
                  stars: 4500,
                  downloads: 8900,
                  updatedAt: "5 hours ago",
                  onShare: () {},
                  onOpen: () {},
                ),
                const SizedBox(height: 20),
                RepoCard(
                  repoName: "go_router",
                  description:
                      "A declarative routing package for Flutter that uses the Router API.",
                  stars: 1200,
                  downloads: 3000,
                  updatedAt: "1 day ago",
                  onShare: () {},
                  onOpen: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
