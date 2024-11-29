import 'package:flutter/material.dart';
import 'package:knighthood/globals/lists.dart';
import 'package:knighthood/globals/maps/level_1_maps.dart';
import 'package:knighthood/models/tile_object.dart';
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
  // Функция для обновления всей карты
  void _updateMap(List<List<TileObject>> map) {
    setState(() {
      for (var i in entities) {
        // Игрок
        if (i.name == 'player') {
          map[i.posY][i.posX].isPlayer = true;
          map[i.prevPosY][i.prevPosX].isPlayer = false;
        }
      }
    });
  }

  // Функция для перемещения определенного энтити в определенном направлении
  void _moveEntity(String name, String direction) {
    // Находим индекс нужного энтити по имени
    var entityIndex = entities.indexWhere((x) => x.name == name);

    // Изменяем координаты
    entities[entityIndex].prevPosY = entities[entityIndex].posY;
    entities[entityIndex].prevPosX = entities[entityIndex].posX;
    switch (direction) {
      case 'up':
        entities[entityIndex].posY--;
        break;
      case 'down':
        entities[entityIndex].posY++;
        break;
      case 'left':
        entities[entityIndex].posX--;
        break;
      case 'right':
        entities[entityIndex].posX++;
        break;
      default:
        throw ('Invalid movement direction "$direction"');
    }

    // Обновление карты
    _updateMap(map1);
  }

  @override
  Widget build(BuildContext context) {
    _updateMap(map1);

    return Scaffold(
      body: Column(
        children: [
          Map(size: 10, map: map1),
          IconButton(
            onPressed: () => _moveEntity('player', 'up'),
            icon: const Icon(Icons.arrow_upward),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => _moveEntity('player', 'left'),
                icon: const Icon(Icons.arrow_back),
              ),
              IconButton(
                onPressed: () => _moveEntity('player', 'down'),
                icon: const Icon(Icons.arrow_downward),
              ),
              IconButton(
                onPressed: () => _moveEntity('player', 'right'),
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
