import 'package:flutter/material.dart';

import '../../../core/shared/components/glass_container.dart';


class OfflineWarning extends StatelessWidget {
  const OfflineWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlassContainer(
      opacity: 0.4,
      color: Colors.yellow,
      margin: EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(
              Icons.warning_rounded,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Ops! Parece que você está offline.\nOs dados podem estar desatualizados. Verifique sua conexão com a internet.',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
