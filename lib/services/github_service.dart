import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:git_spot/view/features/home/model/user_profile_model.dart';
import 'package:git_spot/view/features/repos/model/repo_model.dart';

final githubServiceProvider = Provider((ref) => GithubService());

class GithubService {
  final String _baseUrl = 'https://api.github.com';

  Future<List<UserProfileModel>> searchUsers(String query) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/search/users?q=$query'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> items = data['items'];
      // The search results only contain minimal info, we might need to fetch details for each
      // or just return the minimal info and fetch details on selection.
      // For the search list, we probably only need login and avatar_url.
      // But UserProfileModel requires all fields.
      // Let's return a list where we map what we have, and use placeholders for the rest.
      // OR, we can just return the raw user maps, or a simplified model.
      // Let's stick to UserProfileModel but know that some fields will be partial.

      return items
          .map(
            (item) => UserProfileModel(
              username: item['login'] ?? "unknown",
              name: item['login'] ?? "unknown",
              avatarUrl: item['avatar_url'] ?? "",
              repositoriesCount: "0",
              followersCount: "0",
              followingCount: "0",
              bio: "",
              location: "",
              joinedDate: "",
              email: "",
              link: "",
            ),
          )
          .toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<RepoModel>> searchRepositories(String query) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/search/repositories?q=$query'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> items = data['items'];

      return items.map((item) => RepoModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load repositories');
    }
  }

  Future<List<RepoModel>> getTrendingRepositories() async {
    // Determine the date 7 days ago to simulate trending
    final date = DateTime.now().subtract(const Duration(days: 7));
    final dateString =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

    final response = await http.get(
      Uri.parse(
        '$_baseUrl/search/repositories?q=created:>$dateString&sort=stars&order=desc',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> items = data['items'];

      return items.map((item) => RepoModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load trending repositories');
    }
  }

  Future<List<UserProfileModel>> getTrendingDevelopers() async {
    // Determine the date 30 days ago to simulate trending users based on recent followers/activity
    final date = DateTime.now().subtract(const Duration(days: 30));
    final dateString =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

    final response = await http.get(
      Uri.parse(
        '$_baseUrl/search/users?q=created:>$dateString&sort=followers&order=desc',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> items = data['items'];

      // Note: The search/users API returns simplified user objects.
      // It won't have the full bio/followers count natively unless we re-fetch them individually
      // To keep it performant, we will map what we have from the summary item
      return items.map((item) => UserProfileModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load trending developers');
    }
  }

  Future<UserProfileModel> getUserDetails(String username) async {
    final response = await http.get(Uri.parse('$_baseUrl/users/$username'));

    if (response.statusCode == 200) {
      return UserProfileModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user details');
    }
  }
}
