import 'package:flutter/material.dart';
import 'package:knighthood/globals/maps/level_1_maps.dart';
import 'package:knighthood/pages/game_screen.dart';
import 'package:knighthood/pages/settings_screen.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  void _startGame() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => GameScreen(
                map: map1,
                generateMap: generateMap1,
              )),
    );
  }

  void _goToSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsScreen()),
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
              'Knighthood',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            ElevatedButton(
              onPressed: () => {_startGame()},
              child: const Text('Начать игру'),
            ),
            ElevatedButton(
              onPressed: () => {_goToSettings()},
              child: const Text('Настройки'),
            ),
          ],
        ),
      ),
    );
  }
}
