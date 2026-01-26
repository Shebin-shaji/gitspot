import 'package:flutter/material.dart';

class TrendingDeveloperCard extends StatelessWidget {
  final String username;
  final String name;
  final String avatarUrl;
  final String bio;
  final int totalStars;
  final int publicRepos;
  final String? primaryLanguage;
  final VoidCallback onOpenProfile;

  const TrendingDeveloperCard({
    super.key,
    required this.username,
    required this.name,
    required this.avatarUrl,
    required this.bio,
    required this.totalStars,
    required this.publicRepos,
    this.primaryLanguage,
    required this.onOpenProfile,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onOpenProfile,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              /// Avatar
              CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(avatarUrl),
              ),

              const SizedBox(width: 16),

              /// Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text("@$username", style: theme.textTheme.bodySmall),
                    const SizedBox(height: 6),
                    Text(
                      bio,
                      style: theme.textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),

                    /// Stats
                    Row(
                      children: [
                        _DevStat(
                          icon: Icons.star_border,
                          value: totalStars.toString(),
                        ),
                        const SizedBox(width: 12),
                        _DevStat(
                          icon: Icons.folder_outlined,
                          value: publicRepos.toString(),
                        ),
                        if (primaryLanguage != null) ...[
                          const SizedBox(width: 12),
                          _LanguageBadge(language: primaryLanguage!),
                        ],
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

class _DevStat extends StatelessWidget {
  final IconData icon;
  final String value;

  const _DevStat({required this.icon, required this.value});

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
