import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:git_spot/view/features/home/model/user_profile_model.dart';
import 'package:git_spot/services/github_service.dart';

class HomeState {
  final AsyncValue<UserProfileModel> userProfile;
  final List<UserProfileModel> searchResults;
  final bool isSearching;

  const HomeState({
    required this.userProfile,
    this.searchResults = const [],
    this.isSearching = false,
  });

  HomeState copyWith({
    AsyncValue<UserProfileModel>? userProfile,
    List<UserProfileModel>? searchResults,
    bool? isSearching,
  }) {
    return HomeState(
      userProfile: userProfile ?? this.userProfile,
      searchResults: searchResults ?? this.searchResults,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}

class HomeViewModel extends StateNotifier<HomeState> {
  final GithubService _githubService;
  Timer? _debounceTimer;

  HomeViewModel(this._githubService)
    : super(const HomeState(userProfile: AsyncValue.loading())) {
    _loadUserProfile("Shebin-shaji"); // Default user
  }

  Future<void> _loadUserProfile(String username) async {
    state = state.copyWith(userProfile: const AsyncValue.loading());
    try {
      final user = await _githubService.getUserDetails(username);
      state = state.copyWith(userProfile: AsyncValue.data(user));
    } catch (e, stack) {
      state = state.copyWith(userProfile: AsyncValue.error(e, stack));
    }
  }

  void searchUsers(String query) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    if (query.length < 3) {
      state = state.copyWith(searchResults: [], isSearching: false);
      return;
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      state = state.copyWith(isSearching: true);
      try {
        final results = await _githubService.searchUsers(query);
        state = state.copyWith(searchResults: results, isSearching: false);
      } catch (e) {
        // Handle error quietly or show in UI?
        // For now just clear results or keep previous
        state = state.copyWith(searchResults: [], isSearching: false);
      }
    });
  }

  void clearSearch() {
    state = state.copyWith(searchResults: [], isSearching: false);
  }

  void selectUser(String username) {
    _loadUserProfile(username);
    clearSearch();
  }
}

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>((
  ref,
) {
  final githubService = ref.read(githubServiceProvider);
  return HomeViewModel(githubService);
});
