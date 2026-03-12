class RepoModel {
  final String name;
  final String description;
  final int stars;
  final int
  forks; // We'll map downloads to forks or watchers if we don't have downloads
  final String updatedAt;
  final String htmlUrl;
  final String language;
  final String ownerUsername;
  final String ownerAvatarUrl;

  RepoModel({
    required this.name,
    required this.description,
    required this.stars,
    required this.forks,
    required this.updatedAt,
    required this.htmlUrl,
    required this.language,
    this.ownerUsername = '',
    this.ownerAvatarUrl = '',
  });

  factory RepoModel.fromJson(Map<String, dynamic> json) {
    // Extract owner details safely
    final ownerMap = json['owner'] as Map<String, dynamic>?;
    final parsedOwnerUsername = ownerMap?['login'] ?? '';
    final parsedOwnerAvatarUrl = ownerMap?['avatar_url'] ?? '';

    return RepoModel(
      name: json['name'] ?? '',
      description: json['description'] ?? 'No description available',
      stars: json['stargazers_count'] ?? 0,
      forks: json['forks_count'] ?? 0,
      updatedAt: _formatDate(json['updated_at'] ?? ''),
      htmlUrl: json['html_url'] ?? '',
      language: json['language'] ?? 'Unknown',
      ownerUsername: parsedOwnerUsername,
      ownerAvatarUrl: parsedOwnerAvatarUrl,
    );
  }

  static String _formatDate(String dateString) {
    if (dateString.isEmpty) return 'Unknown';
    try {
      final date = DateTime.parse(dateString);
      final difference = DateTime.now().difference(date);
      if (difference.inDays > 365) {
        return '${(difference.inDays / 365).floor()} years ago';
      } else if (difference.inDays > 30) {
        return '${(difference.inDays / 30).floor()} months ago';
      } else if (difference.inDays > 0) {
        return '${difference.inDays} days ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hours ago';
      } else {
        return 'recently';
      }
    } catch (_) {
      return dateString.substring(0, 10);
    }
  }
}
