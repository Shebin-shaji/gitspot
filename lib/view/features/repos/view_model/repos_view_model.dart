import 'dart:async';
import 'package:flutter_riverpod/legacy.dart';
import 'package:git_spot/services/github_service.dart';
import 'package:git_spot/view/features/repos/model/repo_model.dart';

class ReposState {
  final List<RepoModel> searchResults;
  final bool isSearching;

  const ReposState({this.searchResults = const [], this.isSearching = false});

  ReposState copyWith({List<RepoModel>? searchResults, bool? isSearching}) {
    return ReposState(
      searchResults: searchResults ?? this.searchResults,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}

class ReposViewModel extends StateNotifier<ReposState> {
  final GithubService _githubService;
  Timer? _debounceTimer;

  ReposViewModel(this._githubService) : super(const ReposState());

  void searchRepositories(String query) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    if (query.trim().isEmpty) {
      state = state.copyWith(searchResults: [], isSearching: false);
      return;
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      state = state.copyWith(isSearching: true);
      try {
        final results = await _githubService.searchRepositories(query);
        state = state.copyWith(searchResults: results, isSearching: false);
      } catch (e) {
        state = state.copyWith(searchResults: [], isSearching: false);
      }
    });
  }

  void clearSearch() {
    state = state.copyWith(searchResults: [], isSearching: false);
  }
}

final reposViewModelProvider =
    StateNotifierProvider<ReposViewModel, ReposState>((ref) {
      final githubService = ref.read(githubServiceProvider);
      return ReposViewModel(githubService);
    });
