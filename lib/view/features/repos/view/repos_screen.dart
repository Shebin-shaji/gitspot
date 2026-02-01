import 'package:flutter/material.dart';
import 'package:git_spot/view/features/repos/widgets/repo_card.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_app_bar.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_search_bar.dart';

class ReposScreen extends StatelessWidget {
  const ReposScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomPrimaryAppBar(title: 'Repositories'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 32),
                const CustomPrimaryTextField(labelText: "Search for Repos"),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
