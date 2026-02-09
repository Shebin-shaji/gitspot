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

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'] ?? json['login'] ?? "Unknown",
      avatarUrl: json['avatar_url'] ?? "",
      repositoriesCount: (json['public_repos'] ?? 0).toString(),
      followersCount: (json['followers'] ?? 0).toString(),
      followingCount: (json['following'] ?? 0).toString(),
      bio: json['bio'] ?? "No bio available",
      location: json['location'] ?? "Not Mentioned",
      joinedDate: json['created_at'] != null
          ? "Joined on ${DateTime.parse(json['created_at']).year}"
          : "Joined date unknown",
      email: json['email'] ?? "Not Mentioned",
      link: json['blog'] != null && json['blog'].toString().isNotEmpty
          ? json['blog']
          : "Not Mentioned",
    );
  }
}
