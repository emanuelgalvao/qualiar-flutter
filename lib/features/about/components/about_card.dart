import 'package:flutter/material.dart';

class AboutCard extends StatelessWidget {
  final String title;
  final Widget child;

  const AboutCard({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            child
          ],
        ),
      ),
    );
  }
}
