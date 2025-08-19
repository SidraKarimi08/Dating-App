import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final IconData icon; // ✅ icon parameter
  final VoidCallback onTap;

  const SelectButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.icon, // ✅ icon required
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF7B928) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // ✅ Text left, Icon right
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black54,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
