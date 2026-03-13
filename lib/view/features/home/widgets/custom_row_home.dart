import 'package:flutter/material.dart';

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
        SizedBox(
          width: 320,
          child: Text(
            title ?? "Data Science | AI/ML",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
