import 'package:flutter/material.dart';
import 'package:knighthood/globals/game_state.dart';

class DebugWindow extends StatefulWidget {
  const DebugWindow({super.key});

  @override
  State<DebugWindow> createState() => _DebugWindowState();
}

class _DebugWindowState extends State<DebugWindow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'X: ${currentMap.entities.firstWhere((element) => element.name == 'player').posX}',
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
        Text(
          'Y: ${currentMap.entities.firstWhere((element) => element.name == 'player').posY}',
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
      ],
    );
  }
}
