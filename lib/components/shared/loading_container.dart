import 'package:flutter/material.dart';

import 'glass_container.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassContainer(
        child: Container(
          height: 120,
          padding: const EdgeInsets.all(20),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                'Carregando...',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
