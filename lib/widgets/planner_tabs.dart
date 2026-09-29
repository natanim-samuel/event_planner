import 'package:flutter/material.dart';

class PlannerTabs extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const PlannerTabs({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  static const List<String> tabs = [
    'Guests',
    'Food',
    'Drinks',
    'Equipment',
    'Ingredients',
    'Venue',
    'Tasks',
    'Schedule',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          final selected =
              currentIndex == index;

          return GestureDetector(
            onTap: () => onChanged(index),
            child: Container(
              margin: const EdgeInsets.only(
                right: 28,
              ),
              padding:
              const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: selected
                        ? const Color(
                      0xFFD6AF36,
                    )
                        : Colors.transparent,
                    width: 3,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: 20,
                    color: selected
                        ? const Color(
                      0xFFD6AF36,
                    )
                        : const Color(
                      0xFF8D8982,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}