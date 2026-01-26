import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:git_spot/view/config/theme_provider.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_app_bar.dart';
import 'package:git_spot/view/shared/widgets/custom_primary_search_bar.dart';

class HomeMainView extends ConsumerWidget {
  const HomeMainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

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
        body: Padding(
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

              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Column(
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
                                  "Shebin Shaji",
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
                                  value: "51",
                                ),
                                const SizedBox(width: 12),
                                _StatItem(
                                  label: "Followers",
                                  value: "51",
                                ),
                                const SizedBox(width: 12),
                                _StatItem(
                                  label: "Following",
                                  value: "51",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Icon(Icons.person, color: theme.iconTheme.color),
                        const SizedBox(width: 12),
                        Text(
                          "Data Science | AI/ML",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    Row(
                      children: [
                        Icon(Icons.attach_file_outlined,
                            color: theme.iconTheme.color),
                        const SizedBox(width: 12),
                        Text(
                          "Not Mentioned",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({
    required this.label,
    required this.value,
  });

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
