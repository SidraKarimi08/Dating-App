import 'package:flutter/material.dart';
import 'package:test123/Screens/Profile/notification_screen.dart';

import '../../Widgets/custom_skip_buttn.dart';
import '../../utils/common/buttonstyle.dart';
import '../../utils/common/textStyle.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 275, top: 30),
                child: SkipButton(),
              ),

              SizedBox(height: 45),
              Image.asset("assets/people.png", width: 240, height: 240),
              SizedBox(height: 55),
              GTextStyle(
                text: "Search friend’s",
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              GTextStyle(
                text:
                    "You can find friends from your contact lists\nto connected",
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 148),
              PrimaryButton(label: 'Access to a contact list', onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>NotificationScreen() ,));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
