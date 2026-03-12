import 'package:flutter_riverpod/legacy.dart';
import 'package:git_spot/services/github_service.dart';
import 'package:git_spot/view/features/home/model/user_profile_model.dart';

class TrendingDevelopersState {
  final List<UserProfileModel> trendingDevelopers;
  final bool isLoading;

  const TrendingDevelopersState({
    this.trendingDevelopers = const [],
    this.isLoading = false,
  });

  TrendingDevelopersState copyWith({
    List<UserProfileModel>? trendingDevelopers,
    bool? isLoading,
  }) {
    return TrendingDevelopersState(
      trendingDevelopers: trendingDevelopers ?? this.trendingDevelopers,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class TrendingDevelopersViewModel
    extends StateNotifier<TrendingDevelopersState> {
  final GithubService _githubService;

  TrendingDevelopersViewModel(this._githubService)
    : super(const TrendingDevelopersState()) {
    initLoad();
  }

  Future<void> initLoad() async {
    state = state.copyWith(isLoading: true);
    try {
      final results = await _githubService.getTrendingDevelopers();
      state = state.copyWith(trendingDevelopers: results, isLoading: false);
    } catch (e) {
      state = state.copyWith(trendingDevelopers: [], isLoading: false);
    }
  }
}

final trendingDevelopersViewModelProvider =
    StateNotifierProvider<TrendingDevelopersViewModel, TrendingDevelopersState>(
      (ref) {
        final githubService = ref.read(githubServiceProvider);
        return TrendingDevelopersViewModel(githubService);
      },
    );
