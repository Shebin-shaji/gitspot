import 'package:flutter/material.dart';

class TrendingRepoCard extends StatelessWidget {
  final String repoName;
  final String description;
  final String ownerUsername;
  final String ownerAvatarUrl;
  final int stars;
  final int forks;
  final String? language;
  final bool isTrending;
  final VoidCallback onOpenRepo;

  const TrendingRepoCard({
    super.key,
    required this.repoName,
    required this.description,
    required this.ownerUsername,
    required this.ownerAvatarUrl,
    required this.stars,
    required this.forks,
    this.language,
    required this.isTrending,
    required this.onOpenRepo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onOpenRepo,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Repo name + trending badge
              Row(
                children: [
                  Expanded(
                    child: Text(
                      repoName,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (isTrending)
                    Row(
                      children: [
                        const Icon(
                          Icons.local_fire_department,
                          size: 16,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 4),
                        Text("Trending", style: theme.textTheme.labelSmall),
                      ],
                    ),
                ],
              ),

              const SizedBox(height: 6),

              /// Description
              Text(
                description,
                style: theme.textTheme.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 12),

              /// Owner info
              Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: NetworkImage(ownerAvatarUrl),
                  ),
                  const SizedBox(width: 8),
                  Text(ownerUsername, style: theme.textTheme.labelMedium),
                ],
              ),

              const SizedBox(height: 12),

              /// Stats row
              Row(
                children: [
                  _RepoStat(icon: Icons.star_border, value: stars.toString()),
                  const SizedBox(width: 12),
                  _RepoStat(icon: Icons.call_split, value: forks.toString()),
                  const Spacer(),
                  if (language != null) _LanguageBadge(language: language!),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RepoStat extends StatelessWidget {
  final IconData icon;
  final String value;

  const _RepoStat({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(icon, size: 16, color: theme.iconTheme.color),
        const SizedBox(width: 4),
        Text(value, style: theme.textTheme.bodySmall),
      ],
    );
  }
}

class _LanguageBadge extends StatelessWidget {
  final String language;

  const _LanguageBadge({required this.language});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(language, style: theme.textTheme.labelSmall),
    );
  }
}
