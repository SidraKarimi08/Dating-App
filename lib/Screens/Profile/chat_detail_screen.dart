import 'package:flutter/material.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFFFFC107); // amber
    const bg = Color(0xFFF5F5F7);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          children: [
            // small handle
            const SizedBox(height: 8),
            Container(
              width: 46,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(height: 10),

            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _circleBtn(
                    icon: Icons.arrow_back_ios_new_rounded,
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 12),
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('assets/home5.png'), // Grace
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Grace',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700)),
                      Row(
                        children: [
                          const Icon(Icons.circle,
                              size: 8, color: accent),
                          const SizedBox(width: 6),
                          Text('Online',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600)),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  _circleBtn(icon: Icons.more_vert_rounded, onTap: () {}),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Divider(height: 1, color: Colors.grey.shade300),

            // Today separator
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
              child: Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('Today',
                        style:
                        TextStyle(fontSize: 12, color: Colors.black54)),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                ],
              ),
            ),

            // Messages
            Expanded(
              child: ListView(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                children: const [
                  _Bubble(
                    text:
                    "Hi Jake, how are you? I saw on the app that we've crossed paths several times this week 😄",
                    time: "2:55 PM",
                    isMe: false,
                    highlighted: true, // pale yellow
                  ),
                  SizedBox(height: 14),
                  _Bubble(
                    text:
                    "Haha truly! Nice to meet you Grace! What about a cup of coffee today evening? ☕",
                    time: "3:02 PM",
                    isMe: true,
                    delivered: true,
                  ),
                  SizedBox(height: 14),
                  _Bubble(
                    text: "Sure, let's do it! 😊",
                    time: "3:10 PM",
                    isMe: false,
                  ),
                  SizedBox(height: 14),
                  _Bubble(
                    text:
                    "Great! I will write later the exact time and place. See you soon!",
                    time: "3:12 PM",
                    isMe: true,
                    delivered: true,
                  ),
                ],
              ),
            ),

            // Input bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 14),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const Center(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Your message',
                            hintStyle: TextStyle(color: Colors.black45),
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.emoji_emotions_outlined),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: accent,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.mic_rounded, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ------------------------------ widgets ------------------------------ */

class _Bubble extends StatelessWidget {
  final String text;
  final String time;
  final bool isMe;
  final bool highlighted; // yellow incoming bubble
  final bool delivered;   // amber check

  const _Bubble({
    required this.text,
    required this.time,
    required this.isMe,
    this.highlighted = false,
    this.delivered = false,
  });

  @override
  Widget build(BuildContext context) {
    final maxW = MediaQuery.sizeOf(context).width * 0.76;

    final Color bgColor;
    if (!isMe && highlighted) {
      bgColor = const Color(0xFFFFF6DA); // pale yellow
    } else if (isMe) {
      bgColor = const Color(0xFFF0F0F3); // light grey for my messages
    } else {
      bgColor = Colors.white; // normal incoming
    }

    final radius = BorderRadius.only(
      topLeft: const Radius.circular(16),
      topRight: const Radius.circular(16),
      bottomLeft: Radius.circular(isMe ? 16 : 6),
      bottomRight: Radius.circular(isMe ? 6 : 16),
    );

    return Column(
      crossAxisAlignment:
      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            constraints: BoxConstraints(maxWidth: maxW),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: radius,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Text(text, style: const TextStyle(fontSize: 14)),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment:
          isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Text(time,
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
            if (isMe && delivered) ...const [
              SizedBox(width: 6),
              Icon(Icons.check_circle, size: 14, color: Color(0xFFFFC107)),
            ],
          ],
        ),
      ],
    );
  }
}

class _circleBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const _circleBtn({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Color(0x1F000000),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }
}
