import 'package:flutter/material.dart';

class CustomTitleText extends StatelessWidget {

  const CustomTitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        "Profile details",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 34,
          //fontFamily: 'BulbearLine'
        ),
      ),
    );
  }
}
