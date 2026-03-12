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
              name: item['login'],
              avatarUrl: item['avatar_url'],
              repositoriesCount: "0", // Not in search result
              followersCount: "0", // Not in search result
              followingCount: "0", // Not in search result
              bio: "", // Not in search result
              location: "", // Not in search result
              joinedDate: "", // Not in search result
              email: "", // Not in search result
              link: "", // Not in search result
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

  Future<UserProfileModel> getUserDetails(String username) async {
    final response = await http.get(Uri.parse('$_baseUrl/users/$username'));

    if (response.statusCode == 200) {
      return UserProfileModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user details');
    }
  }
}
