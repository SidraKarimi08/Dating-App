
import 'package:flutter/material.dart';
import 'package:test123/Screens/auth/phone_input_screen.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/trademark.png", height: 100, width: 109),
          SizedBox(height: 30),
          Text(
            "Sign up to continue",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 18),
          SizedBox(
            width: 295,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                // Add action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[700],
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Continue with email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: 295,
            height: 56,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneInputScreen(),));
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
              child: Text("Use Phone number",style: TextStyle(
                color: Color(0xFFEEB738),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),),
            ),
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: <Widget>[
                Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "or sign up with",
                    style: TextStyle(color: Colors.black,fontSize: 12, fontWeight: FontWeight.w700,),
                  ),
                ),
                Expanded(child: Divider(thickness: 1, color: Colors.grey)),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 64,
                height: 64,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey), // border color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  child: Image.asset('assets/facebook.png', width: 30),
                ),
              ),
              SizedBox(width: 15),
              SizedBox(
                width: 64,
                height: 64,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  child: Image.asset('assets/google.png', width: 30),
                ),
              ),
              SizedBox(width: 15),
              SizedBox(
                width: 64,
                height: 64,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  child: Image.asset('assets/apple.png', width: 30),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // Handle Terms of Use tap
                },
                child: Text(
                  'Terms of Use',
                  style: TextStyle(color: Colors.yellow.shade600),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  // Handle Privacy Policy tap
                },
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(color: Colors.yellow.shade600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
