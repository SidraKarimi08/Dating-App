import 'package:flutter/material.dart';
import 'Profile/matching_screen.dart';
import 'Profile/message_screen.dart';
import 'Profile/profile_detail_screen.dart';
import 'home/main_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    MainScreen(),
    MatchingScreen(),
    MessagesScreen(),
    ProfileDetailScreen (),
  ];

  final List<IconData> iconList = [
    Icons.style,
    Icons.favorite,
    Icons.message,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          border: Border(top: BorderSide(color: Colors.grey, width: 0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(iconList.length, (index) {
            final isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: isSelected ? 30 : 0,
                    height: 3,
                    margin: EdgeInsets.only(bottom: 6),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.amber
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Icon(
                    iconList[index],
                    size: 26,
                    color: isSelected ? Colors.amber : Colors.grey,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}





