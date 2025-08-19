import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final double iconSize;
  final double buttonSize;
  final BoxShadow shadow;
  final VoidCallback onTap;

  const ActionButton({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    this.iconSize = 30,
    this.buttonSize = 76,
    this.shadow = const BoxShadow(
      color: Colors.black12,
      blurRadius: 6,
      offset: Offset(0, 3),
    ),
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
          boxShadow: [shadow],
        ),
        child: Center(
          child: Icon(icon, color: iconColor, size: iconSize),
        ),
      ),
    );
  }
}
