import 'package:flutter/cupertino.dart' as icon;
import 'package:flutter/material.dart';
class SortStyle extends StatelessWidget {
  const SortStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return icon.Align(
      alignment: icon.Alignment.topLeft,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {

          },
          borderRadius: BorderRadius.circular(13),
          child: Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                'assets/sort-two.png',
                height: 24,
                width: 24,
              ),
            ),
          ),
        ),
      ),
    );;
  }
}
