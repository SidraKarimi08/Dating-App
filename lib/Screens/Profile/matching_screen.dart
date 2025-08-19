import 'package:flutter/material.dart';
import 'package:test123/Widgets/sortstyle.dart';
import 'package:test123/utils/common/textStyle.dart';

class MatchingScreen extends StatelessWidget {
  const MatchingScreen({super.key});

  // 👉 Put your 6 images + names here
  List<Person> get people => [
    Person('Leilani', 19, 'assets/pic1.png'),
    Person('Annabelle', 20, 'assets/pic2.png'),
    Person('Reagan', 24, 'assets/pic4.png'),
    Person('Hadley', 25, 'assets/pic5.png'),
    Person('Maya', 21, 'assets/pic6.png'),
    Person('Ariana', 23, 'assets/girl1.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final dividerColor = Colors.black.withOpacity(.08);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Header ---
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GTextStyle(
                        text: "Matches",
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                      ),
                      const Spacer(),
                      const SortStyle(),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Padding(
                    // keep subtitle clear of the sort chip
                    padding: EdgeInsets.only(right: 64),
                    child: Text(
                      "This is a list of people who have liked you and your matches.",
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.35,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: Container(height: 1, color: dividerColor)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Today',
                          style: TextStyle(
                            color: Colors.black.withOpacity(.6),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(child: Container(height: 1, color: dividerColor)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // --- Grid with 6 cards ---
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: people.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,          // 2 columns
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 3 / 4.2,  // tall cards like the mock
                ),
                itemBuilder: (context, i) {
                  final p = people[i];
                  return MatchCard(
                    imageAsset: p.image,
                    name: p.name,
                    age: p.age,
                    onDislike: () {},
                    onLike: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- data model ----------
class Person {
  final String name;
  final int age;
  final String image;
  Person(this.name, this.age, this.image);
}

// ---------- card UI ----------
class MatchCard extends StatelessWidget {
  final String imageAsset;
  final String name;
  final int age;
  final VoidCallback? onDislike;
  final VoidCallback? onLike;

  const MatchCard({
    super.key,
    required this.imageAsset,
    required this.name,
    required this.age,
    this.onDislike,
    this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    const double radius = 18;

    return Card(
      elevation: 4,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      clipBehavior: Clip.antiAlias,
      child: AspectRatio(
        aspectRatio: 3 / 4.2,
        child: Stack(
          children: [
            Positioned.fill(child: Image.asset(imageAsset, fit: BoxFit.cover)),

            // soft gradient to make text/buttons readable
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 140,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(.15),
                      Colors.black.withOpacity(.45),
                    ],
                  ),
                ),
              ),
            ),

            // name + age
            Positioned(
              left: 12,
              bottom: 62,
              child: Text(
                '$name, $age',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  shadows: [Shadow(blurRadius: 8, color: Colors.black54)],
                ),
              ),
            ),

            // bottom action bar X | ♥
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 56,
                color: Colors.black.withOpacity(.28),
                child: Row(
                  children: [
                    Expanded(
                      child: _IconTap(
                        onTap: onDislike,
                        child: const Icon(Icons.clear, color: Colors.white, size: 26),
                      ),
                    ),
                    SizedBox(
                      width: 1,
                      child: Center(
                        child: Container(
                          width: 1,
                          height: 26,
                          color: Colors.white.withOpacity(.35),
                        ),
                      ),
                    ),
                    Expanded(
                      child: _IconTap(
                        onTap: onLike,
                        child: const Icon(Icons.favorite, color: Colors.white, size: 26),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IconTap extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  const _IconTap({required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(onTap: onTap, child: Center(child: child)),
    );
  }
}
