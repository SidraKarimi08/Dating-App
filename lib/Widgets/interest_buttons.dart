import 'package:flutter/material.dart';

class InterestChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const InterestChip({
    super.key,
    required this.label,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFFFFB300); // amber
    final Color borderColor = selected ? activeColor : Colors.grey.shade300;
    final Color bgColor = selected ? activeColor.withOpacity(0.08) : Colors.white;
    final Color textColor = selected ? activeColor : Colors.black87;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 1.6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Always keep space for the icon (transparent if not selected)
            Icon(
              Icons.done_all_rounded,
              size: 18,
              color: selected ? activeColor : Colors.transparent,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
