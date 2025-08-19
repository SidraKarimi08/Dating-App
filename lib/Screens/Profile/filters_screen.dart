import 'package:flutter/material.dart';

const kYellow = Color(0xFFEEB738);

class FiltersSheet extends StatefulWidget {
  const FiltersSheet({super.key});

  @override
  State<FiltersSheet> createState() => _FiltersSheetState();
}

class _FiltersSheetState extends State<FiltersSheet> {
  String interestedIn = 'Girls';                // Girls / Boys / Both
  double distance = 40;                         // Distance (km)
  RangeValues age = const RangeValues(20, 28);  // Age range
  final TextEditingController locCtrl =
  TextEditingController(text: 'Chicago, USA');

  @override
  void dispose() {
    locCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    // ✅ Add a Material ancestor for ChoiceChip
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottom),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: Filters + Clear
                Row(
                  children: [
                    const Spacer(),
                    const Text('Filters',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          interestedIn = 'Girls';
                          distance = 40;
                          age = const RangeValues(20, 28);
                          locCtrl.text = 'Chicago, USA';
                        });
                      },
                      child: const Text('Clear',
                          style: TextStyle(color: kYellow, fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                const _Label('Interested in'),
                const SizedBox(height: 8),

                // Girls / Boys / Both (yellow when selected)
                Wrap(
                  spacing: 8,
                  children: [
                    _chip('Girls'),
                    _chip('Boys'),
                    _chip('Both'),
                  ],
                ),

                const SizedBox(height: 18),
                const _Label('Location'),
                const SizedBox(height: 8),

                // Location box
                TextField(
                  controller: locCtrl,
                  decoration: InputDecoration(
                    hintText: 'City, Country',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: const Icon(Icons.arrow_forward, color: kYellow, size: 18),
                  ),
                ),

                const SizedBox(height: 18),

                // Distance
                Row(
                  children: [
                    const _Label('Distance', inline: true),
                    const Spacer(),
                    Text('${distance.round()}km',
                        style: const TextStyle(color: Colors.black54)),
                  ],
                ),
                Slider(
                  value: distance,
                  min: 1,
                  max: 100,
                  activeColor: kYellow,
                  inactiveColor: Colors.black12,
                  onChanged: (v) => setState(() => distance = v),
                ),

                // Age
                Row(
                  children: [
                    const _Label('Age', inline: true),
                    const Spacer(),
                    Text('${age.start.round()}–${age.end.round()}',
                        style: const TextStyle(color: Colors.black54)),
                  ],
                ),
                RangeSlider(
                  values: age,
                  min: 18,
                  max: 60,
                  divisions: 42,
                  activeColor: kYellow,
                  inactiveColor: Colors.black12,
                  onChanged: (v) => setState(() => age = v),
                ),

                const SizedBox(height: 12),
                // Continue button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kYellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Continue',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // simple yellow/white ChoiceChip
  Widget _chip(String label) {
    final selected = (interestedIn == label);
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => setState(() => interestedIn = label),
      selectedColor: kYellow,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: selected ? Colors.white : Colors.black87,
        fontWeight: FontWeight.w700,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.black12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    );
  }
}

// small label widget
class _Label extends StatelessWidget {
  final String text;
  final bool inline;
  const _Label(this.text, {this.inline = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: inline ? EdgeInsets.zero : const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
      ),
    );
  }
}
