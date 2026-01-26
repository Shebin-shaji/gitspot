import 'package:flutter/material.dart';

class RepoCard extends StatelessWidget {
  final String repoName;
  final String description;
  final int stars;
  final int downloads;
  final String updatedAt;
  final VoidCallback onShare;
  final VoidCallback onOpen;

  const RepoCard({
    super.key,
    required this.repoName,
    required this.description,
    required this.stars,
    required this.downloads,
    required this.updatedAt,
    required this.onShare,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: theme.colorScheme.surface
        ,
        border: Border.all(
          color: theme.dividerColor.withOpacity(0.6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Repo name + actions
          Row(
            children: [
              Expanded(
                child: Text(
                  repoName,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.share, size: 18),
                onPressed: onShare,
              ),
              IconButton(
                icon: const Icon(Icons.open_in_new, size: 18),
                onPressed: onOpen,
              ),
            ],
          ),

          const SizedBox(height: 6),

          /// 🔹 Description
          Text(
            description,
            style: theme.textTheme.bodySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 12),

          /// 🔹 Bottom stats row
          Row(
            children: [
              _InfoChip(
                icon: Icons.star_border,
                label: stars.toString(),
              ),
              const SizedBox(width: 12),
              _InfoChip(
                icon: Icons.download_outlined,
                label: downloads.toString(),
              ),
              const Spacer(),
              Text(
                "Updated $updatedAt",
                style: theme.textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.colorScheme.surfaceVariant.withOpacity(0.4),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
