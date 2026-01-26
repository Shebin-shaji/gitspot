import 'package:flutter/material.dart';
import 'package:git_spot/view/features/repos/widgets/repo_card.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_app_bar.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_search_bar.dart';

class ReposScreen extends StatelessWidget {
  const ReposScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          appBar: CustomPrimaryAppBar(title: 'Repositories'),
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Padding(
              padding: .symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 32),
                  CustomPrimaryTextField(labelText: "Search for Repos"),
                  SizedBox(height: 32),
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
      ),
    );
  }
}
