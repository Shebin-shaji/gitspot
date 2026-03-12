import 'package:flutter_riverpod/legacy.dart';
import 'package:git_spot/services/github_service.dart';
import 'package:git_spot/view/features/repos/model/repo_model.dart';

class TrendingReposState {
  final List<RepoModel> trendingRepos;
  final bool isLoading;

  const TrendingReposState({
    this.trendingRepos = const [],
    this.isLoading = false,
  });

  TrendingReposState copyWith({
    List<RepoModel>? trendingRepos,
    bool? isLoading,
  }) {
    return TrendingReposState(
      trendingRepos: trendingRepos ?? this.trendingRepos,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class TrendingReposViewModel extends StateNotifier<TrendingReposState> {
  final GithubService _githubService;

  TrendingReposViewModel(this._githubService)
    : super(const TrendingReposState()) {
    initLoad();
  }

  Future<void> initLoad() async {
    state = state.copyWith(isLoading: true);
    try {
      final results = await _githubService.getTrendingRepositories();
      state = state.copyWith(trendingRepos: results, isLoading: false);
    } catch (e) {
      state = state.copyWith(trendingRepos: [], isLoading: false);
    }
  }
}

final trendingReposViewModelProvider =
    StateNotifierProvider<TrendingReposViewModel, TrendingReposState>((ref) {
      final githubService = ref.read(githubServiceProvider);
      return TrendingReposViewModel(githubService);
    });
