import 'package:flutter/material.dart';

import '../../Widgets/custom_skip_buttn.dart';
import '../../utils/common/buttonstyle.dart';
import '../../utils/common/textStyle.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
              Image.asset("assets/chat.png", width: 240, height: 240),
              SizedBox(height: 55),
              GTextStyle(
                text: "Enable notification’s",
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              GTextStyle(
                text:
                "Get push-notification when you get the match \n or receive a message.",
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 148),
              PrimaryButton(label: 'Access to a contact list', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
