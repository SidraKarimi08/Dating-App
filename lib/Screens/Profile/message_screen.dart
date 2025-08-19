import 'package:flutter/material.dart';
import 'package:test123/utils/common/textStyle.dart'; // GTextStyle
import 'package:test123/utils/common/filters.dart'; // FiltersIcon

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = <_Activity>[
      _Activity('You', 'assets/photomain.png'),
      _Activity('Emma', 'assets/girl1.png'),
      _Activity('Ava', 'assets/girl2.png'),
      _Activity('Sophia', 'assets/content2.png'),
    ];

    final chats = <_Chat>[
      _Chat('Emelie', 'Sticker 😍', '23 min', 1, 'assets/girl1.png'),
      _Chat('Abigail', 'Typing..', '27 min', 2, 'assets/girl2.png'),
      _Chat(
        'Elizabeth',
        'Ok, see you then.',
        '33 min',
        0,
        'assets/content3.png',
      ),
      _Chat(
        'Penelope',
        'You: Hey! What\'s up, long time..',
        '50 min',
        0,
        'assets/photomain.png',
      ),
      _Chat(
        'Chloe',
        'You: Hello how are you?',
        '55 min',
        0,
        'assets/content2.png',
      ),
      _Chat(
        'Grace',
        'You: Great, I will write later',
        '1 hour',
        0,
        'assets/content3.png',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          children: [
            // Header
            Row(
              children: [
                GTextStyle(
                  text: 'Messages',
                  color: Colors.black,
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
                Spacer(),
                FiltersIcon(),
              ],
            ),
            SizedBox(height: 14),

            // Search
            _SearchField(
              onChanged: (v) {
                // plug your search/filter here
              },
            ),
            const SizedBox(height: 18),

            // Activities
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: GTextStyle(
                text: 'Activities',
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 92,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: activities.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (_, i) => _ActivityBubble(data: activities[i]),
              ),
            ),
            const SizedBox(height: 22),

            // Messages
            Align(
              alignment: AlignmentDirectional.centerStart,
              // or Alignment.centerLeft
              child: GTextStyle(
                text: 'Messages',
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 6),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: chats.length,
              separatorBuilder: (_, __) =>
                  Divider(height: 1, color: Colors.grey.shade300, indent: 64),
              itemBuilder: (_, i) => _ChatTile(chat: chats[i]),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------------------- Widgets & Models ---------------------------- */

class _SearchField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const _SearchField({this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    const grey = Color(0xFF9E9E9E); // one solid grey
    final outline = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: grey, width: 1.2),
    );

    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search_rounded, color: grey),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),

        // same border for every state = always full grey
        enabledBorder: outline,
        focusedBorder: outline,
        disabledBorder: outline,
        errorBorder: outline,
        focusedErrorBorder: outline,
        border: outline,
      ),
    );
  }
}

class _Activity {
  final String name;
  final String avatarAsset;

  _Activity(this.name, this.avatarAsset);
}

class _ActivityBubble extends StatelessWidget {
  final _Activity data;

  const _ActivityBubble({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // simple ring around avatar
        Container(
          padding: const EdgeInsets.all(2.2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFFFC107), width: 2),
          ),
          child: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: AssetImage(data.avatarAsset),
            onBackgroundImageError: (_, __) {},
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 68,
          child: Text(
            data.name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class _Chat {
  final String name;
  final String lastMsg;
  final String time;
  final int unread; // 0 = none
  final String avatarAsset;

  _Chat(this.name, this.lastMsg, this.time, this.unread, this.avatarAsset);
}

class _ChatTile extends StatelessWidget {
  final _Chat chat;

  const _ChatTile({required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // TODO: Navigate to chat screen
      },
      contentPadding: const EdgeInsets.symmetric(vertical: 6),
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.grey.shade200,
        backgroundImage: AssetImage(chat.avatarAsset),
        onBackgroundImageError: (_, __) {},
      ),
      title: Text(
        chat.name,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
      ),
      subtitle: Text(
        chat.lastMsg,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.grey.shade700),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            chat.time,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 6),
          if (chat.unread > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              decoration: const BoxDecoration(
                color: Color(0xFFFFC107),
                shape: BoxShape.circle,
              ),
              child: Text(
                '${chat.unread}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}