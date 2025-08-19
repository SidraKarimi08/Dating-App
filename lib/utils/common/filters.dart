import 'package:flutter/cupertino.dart' as icon;
import 'package:flutter/material.dart';

import '../../Screens/Profile/filters_screen.dart';



class  FiltersIcon extends icon.StatelessWidget {
  const  FiltersIcon({super.key});

  @override
  icon.Widget build(icon.BuildContext context) {
    return icon.Align(
      alignment: icon.Alignment.topLeft,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (_) => const FiltersSheet(),
            );
          },
          borderRadius: BorderRadius.circular(13),
          child: Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1.1),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Center(child: Center(
              child: Image.asset(
                'assets/Vector (Stroke).png',
                height: 24,
                width: 24,
              ),
            ),
          ),
        ),
      ),
      ),
    );
  }
}