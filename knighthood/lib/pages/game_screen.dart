import 'package:flutter/material.dart';
import 'package:knighthood/globals/entities.dart';
import 'package:knighthood/globals/game_state.dart';
import 'package:knighthood/globals/settings.dart';
import 'package:knighthood/models/entity.dart';
import 'package:knighthood/models/map_object.dart';
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
      for (var entity in currentMap.entities) {
        // Игрок
        if (entity.name == 'player') {
          // Перемещение игрока на новые координаты
          currentMap.layout[entity.posY][entity.posX].isPlayer = true;
          // Очистка предыдущей клетки
          if (entity.prevPosY != -1 && entity.prevPosX != -1) {
            currentMap.layout[entity.prevPosY][entity.prevPosX].isPlayer =
                false;
          }
        }
        // Кабан
        if (entity.name == 'boar') {
          // Перемещение энтити на новые координаты
          currentMap.layout[entity.posY][entity.posX].isBoar = true;
          // Очистка предыдущей клетки
          if (entity.prevPosY != -1 && entity.prevPosX != -1) {
            currentMap.layout[entity.prevPosY][entity.prevPosX].isBoar = false;
          }
        }
      }
    });
  }

  // Функция для очистки энтити с карты
  void _clearEntities() {
    for (var i in currentMap.entities) {
      currentMap.layout[i.posY][i.posX].isBoar = false;
    }
  }

  // Функция для перемещения определенного энтити в определенном направлении
  void _moveEntity(Entity entity, String direction) {
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
    var newY = entity.posY + tempY;
    var newX = entity.posX + tempX;

    // Проверка на переход за карту, если энтити - игрок
    if (entity.name == 'player') {
      bool moved = false; // Флаг перемещения
      MapObject newMap = currentMap; // Новая карта

      // Запад
      if (newX < 0) {
        if (currentMap.westMap != null) {
          // Перемещение на границу новой карты
          newX = currentMap.westMap!.layout.length - 1;
          // Выбор новой карты
          newMap = currentMap.westMap!;
          moved = true;
        }
      }
      // Юг
      if (newX > currentMap.layout.length - 1) {
        if (currentMap.eastMap != null) {
          // Перемещение на границу новой карты
          newX = 0;
          // Выбор новой карты
          newMap = currentMap.eastMap!;
          moved = true; // Флаг перемещения
        }
      }
      // Если совершилось перемещение
      if (moved) {
        // Очистка энтити с экрана
        _clearEntities();

        // Перемещение игрока на новую карту
        int playerIndex = currentMap.entities
            .indexWhere((element) => element.name == 'player');
        currentMap.entities.removeAt(playerIndex);
        currentMap = newMap;
        currentMap.entities.add(player);

        // Генерация карты
        currentMap.generateMap();
      }
    }

    // Если перешли не в стену, то меняем координаты и обновляем карту
    if (newX >= 0 &&
        newX < currentMap.layout.length &&
        newY >= 0 &&
        newY < currentMap.layout.length) {
      if (currentMap.layout[newY][newX].isFree) {
        // Предыдущие координаты равны настоящим
        entity.prevPosY = entity.posY;
        entity.prevPosX = entity.posX;

        // Настоящие координаты равны новым
        entity.posY = newY;
        entity.posX = newX;

        // Обновление карты, если игрок совершил движение
        if (entity.name == 'player') {
          _updateMap();
        }
      }
    }

    // Передвижение противников после того, как походил игрок
    if (entity.name == 'player') {
      for (var i in currentMap.entities) {
        // Кабан
        if (i.name == 'boar') {
          // Получение ближайшего пути до игрока, алгоритм A*
          var path = i.aStar();
          // Перемещение на один шаг по пути
          _moveEntity(i, path[0]);
        }
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
            onPressed: () => _moveEntity(
                currentMap.entities
                    .firstWhere((element) => element.name == 'player'),
                'up'),
            icon: const Icon(Icons.arrow_upward),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => _moveEntity(
                    currentMap.entities
                        .firstWhere((element) => element.name == 'player'),
                    'left'),
                icon: const Icon(Icons.arrow_back),
              ),
              IconButton(
                onPressed: () => _moveEntity(
                    currentMap.entities
                        .firstWhere((element) => element.name == 'player'),
                    'down'),
                icon: const Icon(Icons.arrow_downward),
              ),
              IconButton(
                onPressed: () => _moveEntity(
                    currentMap.entities
                        .firstWhere((element) => element.name == 'player'),
                    'right'),
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
