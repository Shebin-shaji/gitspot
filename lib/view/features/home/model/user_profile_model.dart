class UserProfileModel {
  final String username;
  final String name;
  final String avatarUrl;
  final String repositoriesCount;
  final String followersCount;
  final String followingCount;
  final String bio;
  final String location;
  final String joinedDate;
  final String email;
  final String link;
  final int totalStars;
  final String? primaryLanguage;

  UserProfileModel({
    required this.username,
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
    this.totalStars = 0,
    this.primaryLanguage,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      username: json['login'] ?? "unknown",
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
