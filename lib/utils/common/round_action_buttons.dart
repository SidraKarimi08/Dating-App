import 'package:flutter/material.dart';

class RoundActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color bg;
  final double size;
  final double iconSize;
  final VoidCallback onTap;

  const RoundActionButton({
    super.key,
    required this.icon,
    required this.color,
    this.bg = Colors.white,
    this.size = 68,
    this.iconSize = 20,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: bg,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Icon(icon, color: color, size: iconSize),
      ),
    );
  }
}
