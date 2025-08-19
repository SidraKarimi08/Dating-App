import 'package:flutter/material.dart';
import 'package:test123/Screens/Profile/gender_screen.dart';
import 'package:test123/Widgets/custom_skip_buttn.dart';
import 'package:test123/utils/common/buttonstyle.dart';
import 'package:test123/utils/common/textStyle.dart';

import '../../Widgets/bottom_sheet_custom_widget.dart';
import '../../Widgets/custom_textfield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    // Wait until the first frame is rendered, then open the bottom sheet
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openBirthdayPicker();
    });
  }

  void _openBirthdayPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) =>
          BirthdayPickerBottomSheet(initialDate: DateTime.now()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [SkipButton()],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: GTextStyle(
                text: "Profile details",
                color: Colors.black,
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 60),
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 99,
                    width: 99,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.grey),
                      image: DecorationImage(
                        image: AssetImage('assets/photo1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEB738),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Center(child: TextFieldCustom(hintText: 'First Name ')),
            SizedBox(height: 8),
            Center(child: TextFieldCustom(hintText: 'Last Name ')),
            SizedBox(height: 10),
            InkWell(
              onTap: _openBirthdayPicker,
              child: Container(
                width: 295,
                height: 58,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Color(0xFFEEB738),
                      size: 20,
                    ),
                    SizedBox(width: 30),
                    Text(
                      "Choose birthday date",
                      style: TextStyle(
                        color: Color(0xFFEEB738),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: PrimaryButton(label: "Confirm", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GenderScreen(),));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
