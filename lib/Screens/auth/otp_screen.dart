import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Widgets/custom_back_button.dart';
import '../Profile/profile_screen.dart';


class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  List<String> otp = ['', '', '', ''];
  int currentIndex = 0;
  int secondsRemaining = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
        startTimer();
      }
    });
  }

  void onNumberTap(String value) {
    if (currentIndex < 4) {
      setState(() {
        otp[currentIndex] = value;
        currentIndex++;
      });
    }
  }

  void onDelete() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        otp[currentIndex] = '';
      });
    }
  }

  Widget otpBox(String digit, bool isFocused) {
    return Container(
      width: 55,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: digit.isNotEmpty ? Colors.amber : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isFocused ? Colors.red : Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: Text(
        digit,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildNumberButton(String value) {
    return GestureDetector(
      onTap: () => onNumberTap(value),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          value,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white
      ,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: BackButtonWidget(icon: CupertinoIcons.back, onPressed: () => Navigator.of(context).pop(), ),
              ),
              const SizedBox(height: 40),
              Text(
                '00:${secondsRemaining.toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Type the verification code\nwe’ve sent you',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                      (index) => otpBox(otp[index], index == currentIndex),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (_, index) {
                    if (index < 9) {
                      return buildNumberButton('${index + 1}');
                    } else if (index == 9) {
                      return const SizedBox(); // empty box
                    } else if (index == 10) {
                      return buildNumberButton('0');
                    } else {
                      return GestureDetector(
                        onTap: onDelete,
                        child: const Icon(Icons.backspace_outlined, size: 26),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Handle resend
                },
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    },
                  child: const Text(
                    'Send again',
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
