import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:git_spot/view/features/repos/view_model/repos_view_model.dart';
import 'package:git_spot/view/features/repos/widgets/repo_card.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_app_bar.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_search_bar.dart';

class ReposScreen extends ConsumerWidget {
  const ReposScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reposState = ref.watch(reposViewModelProvider);
    final reposViewModel = ref.read(reposViewModelProvider.notifier);

    return SafeArea(
      child: Scaffold(
        appBar: const CustomPrimaryAppBar(title: 'Repositories'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 32),
              CustomPrimaryTextField(
                labelText: "Search for Repos",
                onChanged: (value) {
                  reposViewModel.searchRepositories(value);
                },
              ),
              const SizedBox(height: 32),
              Expanded(
                child: reposState.isSearching
                    ? const Center(child: CircularProgressIndicator())
                    : reposState.searchResults.isEmpty
                    ? const Center(
                        child: Text(
                          'No repositories found. Try searching for something else.',
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.builder(
                        itemCount: reposState.searchResults.length,
                        itemBuilder: (context, index) {
                          final repo = reposState.searchResults[index];
                          return RepoCard(
                            repoModel: repo,
                            onShare: () {},
                            onOpen: () {},
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
