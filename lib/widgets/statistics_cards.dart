import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class StatisticsCards extends StatelessWidget {
  final String days;
  final String confirmedGuests;
  final String itemsNeeded;
  final String tasksDone;

  const StatisticsCards({
    super.key,
    required this.days,
    required this.confirmedGuests,
    required this.itemsNeeded,
    required this.tasksDone,
  });

  Widget _card(
      String value,
      String label,
      ) {
    return Container(
      width: 165,
      padding:
      const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: AppTheme.card,
        borderRadius:
        BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.line,
        ),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: AppTheme.gold,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Georgia',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              color: AppTheme.muted,
              fontSize: 10,
              letterSpacing: 0.7,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 83,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _card(days, 'Days to go'),
          const SizedBox(width: 10),
          _card(
            confirmedGuests,
            'Confirmed guests',
          ),
          const SizedBox(width: 10),
          _card(
            itemsNeeded,
            'Items still needed',
          ),
          const SizedBox(width: 10),
          _card(
            tasksDone,
            'Tasks done',
          ),
        ],
      ),
    );
  }
}