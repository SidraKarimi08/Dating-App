import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:test123/Widgets/image_class.dart';

import '../../Widgets/image_click_fun.dart';
import '../../Widgets/interest_buttons.dart';
import '../../utils/common/round_action_buttons.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({super.key});

  @override
  State<ProfileDetailScreen> createState() => _PracPageState();
}
final List<String> interests = [
  'Travelling', 'Books', 'Music', 'Dancing', 'Modeling'
];

final List<String> firstRowImages = [
  ImageClass.one,
  ImageClass.two,

];
final List<String> galleryImage =[
  ImageClass.three,
  ImageClass.four,
  ImageClass.five,

];


// multiple-select: keep selected labels here
final Set<String> selected = {'Travelling', 'Books'};
class _PracPageState extends State<ProfileDetailScreen> {
  get controller => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/picture1.jpg",
                  height: 415,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white, width: 1.5),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 380,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 338,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundActionButton(
                        icon: Icons.close,
                        color: Colors.red,
                        onTap: () =>
                            controller.swipe(CardSwiperDirection.left),
                      ),

                      RoundActionButton(
                        icon: Icons.favorite,
                        color: Colors.white,
                        bg: Colors.amber,
                        size: 77,
                        iconSize: 34,
                        onTap: () =>
                            controller.swipe(CardSwiperDirection.right),
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
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jessica Parker, 23",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                     // Spacer(),
                      Icon(Icons.send_rounded, color: Colors.amber.shade600),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Professional model",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Chicago, IL United States",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],

                      ),
                      Container(
                        width: 61,
                        height: 34,
                        decoration: BoxDecoration(
                          color: Colors.amber.shade50, // light background
                          borderRadius: BorderRadius.circular(12), // rounded corners
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.location_on, color: Colors.amber, size: 18),
                            Text(
                              "1 km",
                              style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 15),
                  Text(
                    "About",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading..",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Read more",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 19),
                  Text(
                    "Interests",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: interests.map((label) {
                        final isSelected = selected.contains(label);
                        return InterestChip(
                          label: label,
                          selected: isSelected,
                          onTap: () {
                            setState(() {
                              isSelected ? selected.remove(label) : selected.add(label);
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Gallery",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(firstRowImages.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(right: index == firstRowImages.length - 1 ? 0 : 12),
                      child: InkWell(
                        onTap:(){   Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FullScreenImageViewer(
                              images: firstRowImages,
                              initialIndex: index,
                            ),
                          ),
                        );},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            firstRowImages[index],
                            width: 142,
                            height: 190,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(galleryImage.length, (index) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => FullScreenImageViewer(
                                  images: galleryImage,
                                  initialIndex: index,
                                ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              galleryImage[index],
                              height: 122,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
