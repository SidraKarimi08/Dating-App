import 'package:flutter/material.dart';
import 'Screens/Profile/chat_detail_screen.dart';
import 'Screens/Profile/profile_detail_screen.dart';
import 'Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    //home: OnboardingScreen  (),
      home:  ChatDetailScreen (),


    );
  }
}


