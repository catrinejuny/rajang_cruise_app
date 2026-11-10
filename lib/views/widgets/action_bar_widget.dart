import 'package:flutter/material.dart';

// Displays Call, Route, and Share action buttons spaced evenly
class ActionBarWidget extends StatelessWidget {
  const ActionBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(primaryColor, Icons.call, 'CALL'),
          _buildButtonColumn(primaryColor, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(primaryColor, Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  // Helper method to build individual icon-label button column
  Widget _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}