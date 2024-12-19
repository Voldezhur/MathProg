import 'package:flutter/material.dart';
import 'package:racing/pages/pregame_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Гонки',
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PregamePage()),
                )
              },
              child: const Text('Начать игру'),
            ),
          ],
        ),
      ),
    );
  }
}
