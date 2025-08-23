import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../Widgets/custom_back_button.dart';
import 'package:test123/utils/common/filters.dart';

import '../../utils/common/round_action_buttons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> images = [
    'assets/photomain.png',
    'assets/girl1.png',
    'assets/girl2.png',
  ];

  final CardSwiperController controller = CardSwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),

            // Top bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: BackButtonWidget(
                    icon: Icons.arrow_back_ios,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Column(
                  children: [
                    Text(
                      "Discover",
                      style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    Text("Chicago, IL", style: TextStyle(fontSize: 12)),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: FiltersIcon(),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ---- Tinder Swipe with flutter_card_swiper ----
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 320),
                  child: CardSwiper(
                    controller: controller,
                    cardsCount: images.length,
                    // allow only left/right like Tinder
                    allowedSwipeDirection: const AllowedSwipeDirection.only(
                      left: true,
                      right: true,
                      up: false,
                      down: false,
                    ),

                    onSwipe: (previousIndex, currentIndex, direction) {
                      if (direction == CardSwiperDirection.right) {
                        debugPrint("Liked ${images[previousIndex]}");
                      } else if (direction == CardSwiperDirection.left) {
                        debugPrint("Disliked ${images[previousIndex]}");
                      }
                      return true;
                    },

                    onEnd: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("No more profiles")),
                      );
                    },

                    cardBuilder: (context, index, percentX, percentY) {
                      final img = images[index];
                      final dx = percentX.abs().clamp(0, 100) / 100.0;

                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(img, fit: BoxFit.cover),

                            // Like/Nope overlay
                            if (percentX != 0)
                              Align(
                                alignment: percentX > 0
                                    ? Alignment.topRight
                                    : Alignment.topLeft,
                                child: Opacity(
                                  opacity: dx,
                                  child: Container(
                                    margin: const EdgeInsets.all(16),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: percentX > 0
                                          ? Colors.green.withOpacity(0.85)
                                          : Colors.red.withOpacity(0.85),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      percentX > 0 ? 'LIKE' : 'NOPE',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            // bottom gradient + labels
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(.9),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, bottom: 16),
                                child: const Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Jessica Parker, 23",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "Professional model",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // distance chip
                            Positioned(
                              top: 12,
                              left: 12,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(.55),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.location_on,
                                        size: 14, color: Colors.white),
                                    SizedBox(width: 4),
                                    Text('1 Km',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Bottom buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundActionButton(
                    icon: Icons.close,
                    color: Colors.red,
                    onTap: () => controller.swipe(CardSwiperDirection.left),
                  ),
                  RoundActionButton(
                    icon: Icons.favorite,
                    color: Colors.white,
                    bg: Colors.amber,
                    size: 77,
                    iconSize: 34,
                    onTap: () => controller.swipe(CardSwiperDirection.right),
                  ),
                  RoundActionButton(
                    icon: Icons.star,
                    color: Colors.purple,
                    onTap: () {},
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


