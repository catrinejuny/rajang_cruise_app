import 'package:flutter/material.dart';

// Padded container displaying the destination description text
class DescriptionWidget extends StatelessWidget {
  final String description;
  final bool showHeading;

  const DescriptionWidget({
    super.key,
    required this.description,
    this.showHeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHeading) ...[
            const Text(
              'About the Destination',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
          ],
          Text(
            description,
            softWrap: true,
            style: const TextStyle(height: 1.5, fontSize: 14),
          ),
        ],
      ),
    );
  }
}