import 'package:flutter/material.dart';

// Displays the top banner image with a bottom-left caption overlay
class HeaderImageWidget extends StatelessWidget {
  final String imageUrl;
  final String caption;

  const HeaderImageWidget({
    super.key,
    required this.imageUrl,
    this.caption = 'Sibu Esplanade Landmark',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.network(
          imageUrl,
          width: double.infinity,
          height: 220,
          fit: BoxFit.cover,
          // Fallback placeholder if network image fails to load
          errorBuilder: (context, error, stackTrace) => Container(
            height: 220,
            color: Colors.blueGrey.shade200,
            child: const Center(
              child: Icon(Icons.directions_boat, size: 64, color: Colors.white),
            ),
          ),
        ),
        // Caption label overlay
        Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            caption,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}