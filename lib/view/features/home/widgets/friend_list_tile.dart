import 'package:flutter/material.dart';

class FriendListTile extends StatelessWidget {
  final String name;
  final String followersCount;
  final String avatarUrl;

  const FriendListTile({
    super.key,
    required this.name,
    required this.followersCount,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(radius: 20, backgroundImage: NetworkImage(avatarUrl)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "$followersCount followers",
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
