import 'package:flutter/material.dart';

class FavoriteListTile extends StatelessWidget {
  final String name;
  final String username;
  final String imageUrl;
  final VoidCallback onShare;
  final VoidCallback onDelete;

  const FavoriteListTile({
    super.key,
    required this.name,
    required this.username,
    required this.imageUrl,
    required this.onShare,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface, // ✅ theme-aware bg
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.dividerColor.withOpacity(0.6)),
      ),
      child: Row(
        children: [
          /// 🔹 Avatar
          CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: theme.colorScheme.surfaceDim,
          ),

          const SizedBox(width: 12),

          /// 🔹 Name + ID
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  "@$username",
                  style: theme.textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          /// 🔹 Actions
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: onShare,
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
