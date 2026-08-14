import 'package:flutter/material.dart';

class ExerciseChipCard extends StatelessWidget {
  const ExerciseChipCard({
    super.key,
    required this.title,
    required this.imagePath,
  });

  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF0D3037),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 78,
        height: 92,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF17454D)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 48,
              height: 48,
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, color: Color(0xFFB2C1C4)),
            ),
          ],
        ),
      ),
    );
  }
}
