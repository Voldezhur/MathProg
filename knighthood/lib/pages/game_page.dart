import 'package:flutter/material.dart';
import 'package:knighthood/globals/maps/level_1_maps.dart';
import 'package:knighthood/widgets/map.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

/*

Make objects move on the board by storing their position, as well as their previous position
Such that when they move they color the new position with their color and the old position gets colored white

*/

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Map(size: 10, map: map1),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_upward),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_downward),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
