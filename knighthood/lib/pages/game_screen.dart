import 'package:flutter/material.dart';
import 'package:knighthood/globals/game_state.dart';
import 'package:knighthood/globals/lists.dart';
import 'package:knighthood/globals/settings.dart';
import 'package:knighthood/pages/title_screen.dart';
import 'package:knighthood/widgets/debug_window.dart';
import 'package:knighthood/widgets/map.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    currentMap.generateMap();
  }

  // Функция для обновления всей карты
  void _updateMap() {
    setState(() {
      for (var i in entities) {
        // Игрок
        if (i.name == 'player') {
          // Перемещение игрока на новые координаты
          currentMap.layout[i.posY][i.posX].isPlayer = true;
          // Очистка предыдущей клетки
          if (i.prevPosY != -1 && i.prevPosX != -1) {
            currentMap.layout[i.prevPosY][i.prevPosX].isPlayer = false;
          }
        }
      }
    });
  }

  void _travel(String direction) {
    switch (direction) {
      case 'north':
        break;
      case 'west':
        break;
      case 'south':
        break;
      case 'east':
        break;
      default:
        throw ('Invalid travel direction "$direction"');
    }
  }

  // Функция для перемещения определенного энтити в определенном направлении
  void _moveEntity(String name, String direction) {
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

    // Обновление координат
    var newY = entities[entityIndex].posY + tempY;
    var newX = entities[entityIndex].posX + tempX;

    // Проверка на переход за карту, если энтити - игрок
    // Запад
    if (name == 'player') {
      if (newX < 0) {
        if (currentMap.westMap != null) {
          newX = currentMap.westMap!.layout.length - 1;
          currentMap = currentMap.westMap!;
          currentMap.generateMap();
        }
      }
      if (newX > currentMap.layout.length - 1) {
        if (currentMap.eastMap != null) {
          newX = 0;
          currentMap = currentMap.eastMap!;
          currentMap.generateMap();
        }
      }
    }

    // Если перешли не в стену, то меняем координаты и обновляем карту
    if (newX >= 0 &&
        newX < currentMap.layout.length &&
        newY >= 0 &&
        newY < currentMap.layout.length) {
      if (currentMap.layout[newY][newX].isFree) {
        // Предыдущие координаты равны настоящим
        entities[entityIndex].prevPosY = entities[entityIndex].posY;
        entities[entityIndex].prevPosX = entities[entityIndex].posX;

        // Настоящие координаты равны новым
        entities[entityIndex].posY = newY;
        entities[entityIndex].posX = newX;

        // Обновление карты
        _updateMap();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _updateMap();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(currentMap.name),
      ),
      body: Column(
        children: [
          Map(size: 10, map: currentMap.layout),
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ElevatedButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TitleScreen()),
              )
            },
            child: const Text('В главное меню'),
          ),
          debugMode ? const DebugWindow() : Container(),
        ],
      ),
    );
  }
}
