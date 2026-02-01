class UserProfileModel {
  final String name;
  final String avatarUrl;
  final String repositoriesCount;
  final String followersCount;
  final String followingCount;
  final String bio;
  final String location;
  final String joinedDate;
  final String email; // Was "Not Mentioned"
  final String link; // Was "Not Mentioned"

  UserProfileModel({
    required this.name,
    required this.avatarUrl,
    required this.repositoriesCount,
    required this.followersCount,
    required this.followingCount,
    required this.bio,
    required this.location,
    required this.joinedDate,
    required this.email,
    required this.link,
  });
}
