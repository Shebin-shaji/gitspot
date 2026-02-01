import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:git_spot/view/features/home/model/user_profile_model.dart';

class HomeViewModel extends StateNotifier<AsyncValue<UserProfileModel>> {
  HomeViewModel() : super(const AsyncValue.loading()) {
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Simulate fetching data
    state = AsyncValue.data(
      UserProfileModel(
        name: "Shebin Shaji",
        avatarUrl:
            "", // Just a placeholder, UI uses local asset or network image logic separately usually, but here we keep structure
        repositoriesCount: "51",
        followersCount: "51",
        followingCount: "51",
        bio: "Data Science | AI/ML",
        location: "Pune",
        joinedDate: "Joined on 2022",
        email: "Not Mentioned",
        link: "Not Mentioned",
      ),
    );
  }
}

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, AsyncValue<UserProfileModel>>((ref) {
      return HomeViewModel();
    });
