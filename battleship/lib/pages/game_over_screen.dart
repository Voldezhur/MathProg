import 'package:battleship/pages/title_screen.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatefulWidget {
  const GameOverScreen({super.key, required this.player});

  final player;

  @override
  State<GameOverScreen> createState() => _GameOverScreenState();
}

class _GameOverScreenState extends State<GameOverScreen> {
  void _goToTitle() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TitleScreen(),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                const Icon(Icons.flag), 
                Text('Игрок ${widget.player} победил!'),
                const Icon(Icons.flag), 
              ],
          ),
          ElevatedButton(onPressed: _goToTitle, child: const Text('Назад в меню'),),
        ],
      ),
    );
  }
}