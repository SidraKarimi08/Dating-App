import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    const headerImage = 'assets/photomain.png';
    final gallery = [
      'assets/girl1.png',
      'assets/girl2.png',
      'assets/pic2.png',
      'assets/pic6.png',
      'assets/photomain.png',
      'assets/pic1.png',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F7),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top image with back button
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 3 / 4,
                    child: Image.asset(headerImage, fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: _circleIcon(
                      icon: Icons.arrow_back_ios_new_rounded,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),

              // White card (slightly overlapping)
              Transform.translate(
                offset: const Offset(0, -24),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16, 36, 16, 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Floating actions: ✖ ❤ ☆
                      Transform.translate(
                        offset: const Offset(0, -28),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _roundAction(icon: Icons.close, onTap: () {}),
                            const SizedBox(width: 18),
                            _roundAction(
                              icon: Icons.favorite,
                              big: true,
                              gradient: const LinearGradient(
                                colors: [Color(0xFFFFC107), Color(0xFFFF6F00)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              onTap: () {},
                            ),
                            const SizedBox(width: 18),
                            _roundAction(icon: Icons.star, onTap: () {}),
                          ],
                        ),
                      ),

                      // Name + send button
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Jessica Parker, 23',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ),
                          _outlinedIcon(icon: Icons.send_rounded, onTap: () {}),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Professional model',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 13.5),
                      ),

                      const SizedBox(height: 18),
                      const _SectionTitle('Location'),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.location_on_rounded, size: 18, color: Colors.grey.shade700),
                          const SizedBox(width: 6),
                          const Expanded(
                            child: Text('Chicago, IL, United States', style: TextStyle(fontSize: 14)),
                          ),
                          _chipSmall('1 km'),
                        ],
                      ),

                      const SizedBox(height: 18),
                      const _SectionTitle('About'),
                      const SizedBox(height: 6),
                      Text(
                        "My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading..",
                        style: TextStyle(color: Colors.grey.shade700, height: 1.35),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Read more',
                          style: TextStyle(color: Colors.green.shade600, fontWeight: FontWeight.w600),
                        ),
                      ),

                      const SizedBox(height: 18),
                      const _SectionTitle('Interests'),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: const [
                          _InterestChip('Travelling', checked: true),
                          _InterestChip('Books', checked: true),
                          _InterestChip('Music'),
                          _InterestChip('Dancing'),
                          _InterestChip('Modeling'),
                        ],
                      ),

                      const SizedBox(height: 18),
                      Row(
                        children: const [
                          _SectionTitle('Gallery'),
                          Spacer(),
                          Text('See all',
                              style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFFFFA000))),
                        ],
                      ),
                      const SizedBox(height: 10),

                      GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: gallery.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.15,
                        ),
                        itemBuilder: (_, i) => ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(gallery[i], fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* ------------------------------ helpers ------------------------------ */

  static Widget _circleIcon({required IconData icon, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.9),
          shape: BoxShape.circle,
          boxShadow: const [BoxShadow(color: Color(0x22000000), blurRadius: 12, offset: Offset(0, 6))],
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }

  static Widget _roundAction({
    required IconData icon,
    VoidCallback? onTap,
    bool big = false,
    LinearGradient? gradient,
  }) {
    final size = big ? 64.0 : 52.0;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(size / 2),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: gradient == null ? Colors.white : null,
          gradient: gradient,
          boxShadow: const [BoxShadow(color: Color(0x1F000000), blurRadius: 16, offset: Offset(0, 8))],
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Icon(icon, color: big ? Colors.white : Colors.black87),
      ),
    );
  }

  static Widget _outlinedIcon({required IconData icon, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Icon(icon, size: 18, color: Colors.black87),
      ),
    );
  }

  static Widget _chipSmall(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6DA),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFFFC107)),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12, color: Color(0xFFFF8F00))),
    );
  }
}

/* --------------------------- small leaf widgets --------------------------- */

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700));
  }
}

class _InterestChip extends StatelessWidget {
  final String text;
  final bool checked;
  const _InterestChip(this.text, {this.checked = false});

  @override
  Widget build(BuildContext context) {
    final border = Border.all(color: const Color(0xFFFFC107));
    final bg = checked ? const Color(0xFFFFF6DA) : Colors.white;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: checked ? border : Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (checked) ...const [
            Icon(Icons.check_circle, size: 16, color: Color(0xFFFFC107)),
            SizedBox(width: 6),
          ],
          Text(text, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
