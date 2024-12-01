import 'package:flutter/material.dart';
import 'package:knighthood/pages/game_screen.dart';
import 'package:knighthood/pages/settings_screen.dart';
import 'package:knighthood/pages/world_editor.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  void _startGame() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameScreen()),
    );
  }

  void _goToSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsScreen()),
    );
  }

  void _goToEditor() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WorldEditor()),
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
            ElevatedButton(
              onPressed: () => {_goToEditor()},
              child: const Text('Редактор карт'),
            ),
          ],
        ),
      ),
    );
  }
}
