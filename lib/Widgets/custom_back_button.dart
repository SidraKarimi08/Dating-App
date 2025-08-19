import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed; // Changed from String to IconData

  const BackButtonWidget({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(13),
            child: Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 1.1),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Center(child: Icon(icon, color: Colors.orange)),
            ),
          ),
        ),
      ),
    );
  }
}
