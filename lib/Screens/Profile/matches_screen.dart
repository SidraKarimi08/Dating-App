import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test123/Screens/home/main_screen.dart';
import 'package:test123/utils/common/buttonstyle.dart';
import 'package:test123/utils/common/textStyle.dart';

import '../../utils/common/filters.dart';
import 'filters_screen.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/twophotos.png',
            width: 294,
            height: 403,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          GTextStyle(
            text: "It’s a match, Jake!",
            color: Color(0xFFEEB738),
            fontSize: 34,
            fontWeight: FontWeight.w700,
          ),
          GTextStyle(
            text: "Start a conversation now with each other",
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 25),
          PrimaryButton(
            label: "Say hello",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => (FiltersSheet())),
              );
            },
          ),
          SizedBox(height: 10),
          SizedBox(width: double.infinity,
            height: 50,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey), // optional: border color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ), // optional
              ),
              child: Text(
                "Keep swiping",
                style: TextStyle(
                  color: Color(0xFFEEB738),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
