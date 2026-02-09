import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:git_spot/view/features/home/view_model/home_view_model.dart';
import 'package:git_spot/view/config/theme_provider.dart';
import 'package:git_spot/view/features/home/widgets/custom_row_home.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_app_bar.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_search_bar.dart';
import 'package:git_spot/view/features/home/widgets/custom_column_widget_home.dart';
import 'package:go_router/go_router.dart';
import 'package:git_spot/view/features/home/widgets/stat_item.dart';

class HomeMainView extends ConsumerWidget {
  const HomeMainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final homeState = ref.watch(homeViewModelProvider);
    final userProfileState = homeState.userProfile;
    final viewModel = ref.read(homeViewModelProvider.notifier);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomPrimaryAppBar(
          title: "GitSpot",
          actions: [
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () {
                ref.read(themeProvider.notifier).toggleTheme();
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    CustomPrimaryTextField(
                      labelText: "Search for Git users",
                      onChanged: (value) => viewModel.searchUsers(value),
                    ),

                    // Search Results List
                    if (homeState.searchResults.isNotEmpty)
                      Container(
                        constraints: const BoxConstraints(maxHeight: 200),
                        margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: homeState.searchResults.length,
                          itemBuilder: (context, index) {
                            final user = homeState.searchResults[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: user.avatarUrl.isNotEmpty
                                    ? NetworkImage(user.avatarUrl)
                                    : null,
                                child: user.avatarUrl.isEmpty
                                    ? const Icon(Icons.person)
                                    : null,
                              ),
                              title: Text(user.name),
                              onTap: () {
                                viewModel.selectUser(user.name);
                              },
                            );
                          },
                        ),
                      ),

                    const SizedBox(height: 6),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Search a User",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),

              // User Profile Content
              userProfileState.when(
                data: (userProfile) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 45,
                                  backgroundImage:
                                      userProfile.avatarUrl.isNotEmpty
                                      ? NetworkImage(userProfile.avatarUrl)
                                      : null,
                                ),
                                const SizedBox(width: 12),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          child: Text(
                                            userProfile.name,
                                            style: theme.textTheme.titleLarge,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Icon(
                                          Icons.favorite,
                                          color: theme.iconTheme.color,
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 10),

                                    Row(
                                      children: [
                                        StatItem(
                                          label: "Repositories",
                                          value: userProfile.repositoriesCount,
                                        ),
                                        const SizedBox(width: 12),
                                        StatItem(
                                          label: "Followers",
                                          value: userProfile.followersCount,
                                        ),
                                        const SizedBox(width: 12),
                                        StatItem(
                                          label: "Following",
                                          value: userProfile.followingCount,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            Column(
                              spacing: 14,
                              crossAxisAlignment: .start,
                              children: [
                                CustomRowHome(
                                  theme: theme,
                                  title: userProfile.bio,
                                  icon: Icons.person,
                                ),
                                CustomRowHome(
                                  theme: theme,
                                  title: userProfile.email,
                                  icon: Icons.attach_file_outlined,
                                ),
                                CustomRowHome(
                                  theme: theme,
                                  title: userProfile.location,
                                  icon: Icons.location_on_outlined,
                                ),
                                CustomRowHome(
                                  theme: theme,
                                  title: userProfile.link,
                                  icon: Icons.attach_file_outlined,
                                ),
                                CustomRowHome(
                                  theme: theme,
                                  title: userProfile.joinedDate,
                                  icon: Icons.timer_outlined,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            CustomColumnWidgetHome(
                              title: "Repositories",
                              icon: Icons.file_copy,
                              onTap: () => context.go('/home/user-repos'),
                            ),
                            CustomColumnWidgetHome(
                              title: "Timeline",
                              icon: Icons.timeline,
                              onTap: () => context.go('/home/timeline'),
                            ),
                            CustomColumnWidgetHome(
                              title: "Friends",
                              icon: Icons.group,
                              onTap: () => context.go('/home/friends'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                loading: () => const Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, stack) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(child: Text('Error: $error')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
