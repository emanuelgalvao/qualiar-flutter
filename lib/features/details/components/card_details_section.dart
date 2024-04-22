import 'package:flutter/material.dart';

import '../../../core/shared/components/glass_container.dart';

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
              style: Theme.of(context).textTheme.titleSmall
            ),
            const SizedBox(height: 10),
            child
          ],
        ),
      ),
    );
  }
}
