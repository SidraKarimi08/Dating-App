import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test123/Screens/Profile/user_interests_screen.dart';
import 'package:test123/Widgets/custom_skip_buttn.dart';
import '../../Widgets/custom_back_button.dart';
import '../../Widgets/gender_select_button.dart';
import '../../utils/common/buttonstyle.dart'; // Assuming PrimaryButton is here
import '../../utils/common/textStyle.dart'; // For GTextStyle

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back & Skip Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtonWidget(
                    icon: CupertinoIcons.back,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  SkipButton(),
                ],
              ),

              const SizedBox(height: 40),

              // Title using GTextStyle
              const GTextStyle(
                text: "I am a",
                color: Colors.black,
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),

              const SizedBox(height: 20),

              // Selection buttons
              SelectButton(
                text: "Woman",
                isSelected: selectedIndex == 0,
                onTap: () {
                  setState(() => selectedIndex = 0);
                },
                icon: CupertinoIcons.checkmark_alt,
              ),
              SelectButton(
                text: "Man",
                isSelected: selectedIndex == 1,
                onTap: () {
                  setState(() => selectedIndex = 1);
                },
                icon: CupertinoIcons.checkmark_alt,
              ),
              SelectButton(
                text: "Choose another",
                isSelected: selectedIndex == 2,
                onTap: () {
                  setState(() => selectedIndex = 2);
                },
                icon: CupertinoIcons.right_chevron,
              ),

              SizedBox(height: 235),

              // Continue button
              PrimaryButton(
                label: "Continue",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InterestsScreen()),
                  );
                  // Your action here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
