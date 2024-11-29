import 'package:flutter/material.dart';
import 'package:knighthood/globals/lists.dart';
import 'package:knighthood/models/tile_object.dart';
import 'package:knighthood/widgets/map.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.map, required this.generateMap});

  final List<List<TileObject>> map;
  final Function generateMap;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

/*

Make objects move on the board by storing their position, as well as their previous position
Such that when they move they color the new position with their color and the old position gets colored white

*/

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    widget.generateMap();
  }

  // Функция для обновления всей карты
  void _updateMap(List<List<TileObject>> map) {
    setState(() {
      for (var i in entities) {
        // Игрок
        if (i.name == 'player') {
          map[i.posY][i.posX].isPlayer = true;
          if (i.prevPosY != -1 && i.prevPosX != -1) {
            map[i.prevPosY][i.prevPosX].isPlayer = false;
          }
        }
      }
    });
  }

  // Функция для перемещения определенного энтити в определенном направлении
  void _moveEntity(String name, String direction, List<List<TileObject>> map) {
    // Находим индекс нужного энтити по имени
    var entityIndex = entities.indexWhere((x) => x.name == name);

    // Изменяем координаты
    int tempY = 0;
    int tempX = 0;

    // Проверка на коллизию
    switch (direction) {
      case 'up':
        tempY--;
        break;
      case 'down':
        tempY++;
        break;
      case 'left':
        tempX--;
        break;
      case 'right':
        tempX++;
        break;
      default:
        throw ('Invalid movement direction "$direction"');
    }

    // Обновление координат, если не идем в стену
    var newY = entities[entityIndex].posY + tempY;
    var newX = entities[entityIndex].posX + tempX;

    if (map[newY][newX].isFree) {
      entities[entityIndex].prevPosY = entities[entityIndex].posY;
      entities[entityIndex].prevPosX = entities[entityIndex].posX;

      entities[entityIndex].posY = newY;
      entities[entityIndex].posX = newX;
    }

    // Обновление карты
    _updateMap(map);
  }

  @override
  Widget build(BuildContext context) {
    _updateMap(widget.map);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Игра'),
      ),
      body: Column(
        children: [
          Map(size: 10, map: widget.map),
          IconButton(
            onPressed: () => _moveEntity('player', 'up', widget.map),
            icon: const Icon(Icons.arrow_upward),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => _moveEntity('player', 'left', widget.map),
                icon: const Icon(Icons.arrow_back),
              ),
              IconButton(
                onPressed: () => _moveEntity('player', 'down', widget.map),
                icon: const Icon(Icons.arrow_downward),
              ),
              IconButton(
                onPressed: () => _moveEntity('player', 'right', widget.map),
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ElevatedButton(
            onPressed: () => {Navigator.pop(context)},
            child: const Text('В главное меню'),
          ),
        ],
      ),
    );
  }
}
