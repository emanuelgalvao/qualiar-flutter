import 'package:flutter/material.dart';

import '../glass_container.dart';

class CardDetailsSection extends StatelessWidget {
  final String title;
  final Widget child;

  const CardDetailsSection({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      margin: EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            child
          ],
        ),
      ),
    );
  }
}
