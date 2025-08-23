import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullScreenImageViewer extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const FullScreenImageViewer({
    Key? key,
    required this.images,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<FullScreenImageViewer> createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<FullScreenImageViewer> {
  late PageController _pageController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            // 🔼 Top Close Button
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(right: 230),
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusGeometry.circular(14),
                      border: Border.all(color: Colors.grey.withOpacity(0.3))
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.pink),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),

            // 🔼 Main Zoomable / Swipeable Image
            Expanded(
              child: PhotoViewGallery.builder(
                itemCount: widget.images.length,
                pageController: _pageController,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(widget.images[index]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(color: Colors.white),
              ),
            ),

            // 🔼 Thumbnail Gallery (Bottom)
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.images.length, (index) {
                    bool isSelected = index == currentIndex;

                    return GestureDetector(
                      onTap: () {
                        _pageController.jumpToPage(index);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: isSelected
                              ? Image.asset(
                            widget.images[index],
                            width: 70,
                            height: 90,
                            fit: BoxFit.cover,
                          )
                              : Stack(
                            children: [
                              Image.asset(
                                widget.images[index],
                                width: 70,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                              Positioned.fill(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 1.6, sigmaY: 1.6), // blur amount
                                  child: Container(
                                    color: Colors.white.withOpacity(0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}