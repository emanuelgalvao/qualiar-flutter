import 'package:air_pollution_app/components/glass_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final principalCardAvailableWidth = mediaQuery.size.width - 16 - (6 * 4);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Air Pollution'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                'https://i.pinimg.com/originals/58/02/ff/5802ff4cb2c6fa5d68d3f113812a4533.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const GlassContainer(
              color: Colors.yellow,
              margin: EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.warning_rounded, size: 40, color: Colors.white,),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Ops! Parece que você está offline.\nOs dados podem estar desatualizados. Verifique sua conexão com a internet.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GlassContainer(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Curitiba, PR',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: GlassContainer(
                                color: Colors.blue,
                                child: Container(
                                  height: 100,
                                  alignment: Alignment.center,
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '77',
                                        style: TextStyle(fontSize: 40),
                                      ),
                                      Text('Saudavel'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                              child: Column(
                                children: [
                                  GlassContainer(
                                    color: Colors.green,
                                    borderRadius: 25,
                                    child: SizedBox(
                                      height: 45,
                                      child: Center(
                                        child: Text('Min. 60'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  GlassContainer(
                                    color: Colors.green,
                                    borderRadius: 25,
                                    child: SizedBox(
                                      height: 45,
                                      child: Center(
                                        child: Text('Max. 80'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [1, 2, 3, 4, 5].map((e) {
                          return Expanded(
                            child: GlassContainer(
                              color: Colors.red,
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              child: SizedBox(
                                height: principalCardAvailableWidth / 5,
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '199',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text('23/12'),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      )
                    ]),
              ),
            ),
            GlassContainer(
              margin: const EdgeInsets.only(top: 10),
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'São Paulo, SP',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GlassContainer(
                      color: Colors.blue,
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '77',
                              style: TextStyle(fontSize: 26),
                            ),
                            Text('Saudavel'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GlassContainer(
              margin: const EdgeInsets.only(top: 10),
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'São Paulo, SP',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GlassContainer(
                      color: Colors.blue,
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '77',
                              style: TextStyle(fontSize: 26),
                            ),
                            Text('Saudavel'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GlassContainer(
              margin: const EdgeInsets.only(top: 10),
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'São Paulo, SP',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GlassContainer(
                      color: Colors.blue,
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '77',
                              style: TextStyle(fontSize: 26),
                            ),
                            Text('Saudavel'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
