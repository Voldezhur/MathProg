import 'package:battleship/globals/playing_fields.dart';
import 'package:battleship/pages/game_screen.dart';
import 'package:flutter/material.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  void _startGame(singleplayer) {
    // Очистка игровых полей (берется из playing_fields.dart)
    clearField1();
    clearField2();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(
          singleplayer: singleplayer,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Морской бой',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _startGame(true),
                  child: const Text('Одиночная игра'),
                ),
                ElevatedButton(
                  onPressed: () => _startGame(false),
                  child: const Text('На двоих'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
