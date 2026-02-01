import 'package:flutter/material.dart';

class CustomColumnWidgetHome extends StatelessWidget {
  const CustomColumnWidgetHome({super.key, this.title, this.icon, this.onTap});

  final String? title;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: theme.colorScheme.surface,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon ?? Icons.file_copy, color: theme.iconTheme.color),
            const SizedBox(height: 8),
            Text(title ?? "Repositories", style: theme.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
