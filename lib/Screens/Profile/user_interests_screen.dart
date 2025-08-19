import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test123/utils/common/buttonstyle.dart';
import '../../Widgets/custom_back_button.dart';
import '../../Widgets/custom_skip_buttn.dart';
import '../../Widgets/custom_user_select.dart';
import '../../utils/common/textStyle.dart';
import '../home_screen.dart';


class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<Map<String, dynamic>> interests = [
    {"icon": Icons.camera_alt_outlined, "text": "Photography"},
    {"icon": Icons.shopping_bag_outlined, "text": "Shopping"},
    {"icon": Icons.mic_none, "text": "Karaoke"},
    {"icon": Icons.self_improvement, "text": "Yoga"},
    {"icon": Icons.restaurant_menu, "text": "Cooking"},
    {"icon": Icons.sports_tennis, "text": "Tennis"},
    {"icon": Icons.directions_run, "text": "Run"},
    {"icon": Icons.pool, "text": "Swimming"},
    {"icon": Icons.brush_outlined, "text": "Art"},
    {"icon": Icons.flight_takeoff, "text": "Traveling"},
    {"icon": Icons.sports_mma, "text": "Extreme"},
    {"icon": Icons.music_note, "text": "Music"},
    {"icon": Icons.local_bar, "text": "Drink"},
    {"icon": Icons.videogame_asset, "text": "Video games"},
  ];

  final Set<int> selectedIndexes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              SizedBox(height: 20),
              GTextStyle(
                text: "Your interests",
                color: Colors.black,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 8),
              GTextStyle(
                text:
                    "Select a few of your interests and let everyone know what you're passionate about.",
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: interests.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 3,
                  ),
                  itemBuilder: (context, index) {
                    final item = interests[index];
                    final isSelected = selectedIndexes.contains(index);

                    return SelectIconButton(
                      icon: item["icon"],
                      text: item["text"],
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedIndexes.remove(index);
                          } else {
                            selectedIndexes.add(index);
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  label: "Continue",
                  onPressed: () {
                    Navigator .push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                    debugPrint(
                      "Selected: ${selectedIndexes.map((i) => interests[i]['text'])}",
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
