import 'package:air_pollution_app/components/home/card_other_location.dart';
import 'package:air_pollution_app/components/home/offline_warning.dart';
import 'package:flutter/material.dart';

import '../components/home/card_favorite_location.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                'https://i.pinimg.com/originals/58/02/ff/5802ff4cb2c6fa5d68d3f113812a4533.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            AppBar(
              title: const Text(
                'Air Pollution',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black54,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Column(
                children: [
                  OfflineWarning(),
                  CardFavoriteLocation(
                    title: 'Curitiba, PR',
                    currentValue: 77,
                    minValue: 60,
                    maxValue: 80,
                    nextDays: {
                      '24/03': 76,
                      '25/03': 78,
                      '26/03': 70,
                      '27/03': 75,
                      '28/03': 73,
                    },
                  ),
                  CardOtherLocation(
                    title: 'São Paulo, SP',
                    value: 80,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
