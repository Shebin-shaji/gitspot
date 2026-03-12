import 'package:flutter/material.dart';
import 'package:git_spot/view/features/repos/model/repo_model.dart';

class TrendingRepoCard extends StatelessWidget {
  final RepoModel repoModel;
  final bool isTrending;
  final VoidCallback onOpenRepo;

  const TrendingRepoCard({
    super.key,
    required this.repoModel,
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
              Row(
                children: [
                  Expanded(
                    child: Text(
                      repoModel.name,
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

              Text(
                repoModel.description,
                style: theme.textTheme.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: NetworkImage(repoModel.ownerAvatarUrl),
                    onBackgroundImageError: (_, _) =>
                        const Icon(Icons.person, size: 14),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    repoModel.ownerUsername,
                    style: theme.textTheme.labelMedium,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  _RepoStat(
                    icon: Icons.star_border,
                    value: repoModel.stars.toString(),
                  ),
                  const SizedBox(width: 12),
                  _RepoStat(
                    icon: Icons.call_split,
                    value: repoModel.forks.toString(),
                  ),
                  const Spacer(),
                  if (repoModel.language != 'Unknown')
                    _LanguageBadge(language: repoModel.language),
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
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(language, style: theme.textTheme.labelSmall),
    );
  }
}
