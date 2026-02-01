import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:git_spot/view/features/home/view_model/home_view_model.dart';
import 'package:git_spot/view/config/theme_provider.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_app_bar.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_search_bar.dart';
import 'package:git_spot/view/features/home/widgets/custom_column_widget_home.dart';
import 'package:go_router/go_router.dart';

class HomeMainView extends ConsumerWidget {
  const HomeMainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final userProfileState = ref.watch(homeViewModelProvider);

    return SafeArea(
      child: Scaffold(
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
        body: userProfileState.when(
          data: (userProfile) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  const CustomPrimaryTextField(
                    labelText: "Search for Git users",
                  ),

                  const SizedBox(height: 6),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Search a Repo",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(radius: 45),
                          const SizedBox(width: 12),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    userProfile.name,
                                    style: theme.textTheme.titleLarge,
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
                                  _StatItem(
                                    label: "Repositories",
                                    value: userProfile.repositoriesCount,
                                  ),
                                  const SizedBox(width: 12),
                                  _StatItem(
                                    label: "Followers",
                                    value: userProfile.followersCount,
                                  ),
                                  const SizedBox(width: 12),
                                  _StatItem(
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
                  SizedBox(height: 32),
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
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }
}

class CustomRowHome extends StatelessWidget {
  const CustomRowHome({super.key, required this.theme, this.title, this.icon});

  final ThemeData theme;
  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon ?? Icons.person, color: theme.iconTheme.color),
        const SizedBox(width: 12),
        Text(
          title ?? "Data Science | AI/ML",
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(label, style: theme.textTheme.bodySmall),
        Text(value, style: theme.textTheme.titleMedium),
      ],
    );
  }
}
