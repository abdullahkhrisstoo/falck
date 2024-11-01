import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String icon;
  final String title;
  final bool isMainSelected;
  final bool isSecondarySelected;
  final VoidCallback onTap;

  const CategoryTile({super.key, 
    required this.icon,
    required this.title,
    required this.isMainSelected,
    required this.isSecondarySelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSecondarySelected
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.surfaceContainerHighest,
            width: 2.0,
          ),
          color: isMainSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              icon,
              style: const TextStyle(fontSize: 36),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
