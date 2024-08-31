import 'package:flutter/material.dart';

class RandomImageBackgroundWidget extends StatelessWidget {
  final Widget child;

  const RandomImageBackgroundWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: Image.network(
            'https://i.pinimg.com/originals/58/02/ff/5802ff4cb2c6fa5d68d3f113812a4533.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background.withOpacity(0.4),
          ),
          child: child,
        )
      ],
    );
  }
}
