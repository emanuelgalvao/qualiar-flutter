import 'package:flutter/material.dart';

class LocationDetailsScreen extends StatelessWidget {
  const LocationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curitiba'),
        backgroundColor: Colors.orange,
      )
    );
  }
}