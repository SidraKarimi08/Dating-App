import 'package:flutter/material.dart';

import '../../Widgets/custom_back_button.dart';

// import your custom back button:
/// import 'package:your_app/widgets/back_button_widget.dart';

class ImagePreviewScreen extends StatefulWidget {
  const ImagePreviewScreen({super.key});

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  final images = [
    'assets/fullscreen.png',
    'assets/girl1.png',
    'assets/girl2.png',
    'assets/photomain.png',
  ];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ===== Header (button on TOP of image) =====
            Container(
              height: 68,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 14),
              alignment: Alignment.centerLeft,
              child: BackButtonWidget(
                icon: Icons.arrow_back_ios,
                onPressed: () => Navigator.of(context).pop(),
              ), // your custom button
            ),
            SizedBox(height: 20,),

            // ===== Main image (no overlay) =====
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    images[selected],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),

            // ===== Thumbnails bar =====
            Container(
              margin: const EdgeInsets.fromLTRB(14, 10, 14, 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              height: 110,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, i) {
                  final isSelected = i == selected;
                  return GestureDetector(
                    onTap: () => setState(() => selected = i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      width: 74,
                      height: 74,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade200,
                        border: isSelected
                            ? Border.all(
                                color: Colors.black.withOpacity(.25),
                                width: 1,
                              )
                            : null,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Opacity(
                          opacity: isSelected ? 1 : 0.6,
                          child: Image.asset(images[i], fit: BoxFit.cover),
                        ),
                      ),
                    ),
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
