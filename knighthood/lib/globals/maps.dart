import 'package:knighthood/globals/consts.dart';
import 'package:knighthood/globals/entities.dart';
import 'package:knighthood/models/map_object.dart';

// Функции карт
void clearMapLayout(MapObject map) {
  for (var i in map.layout) {
    for (var ii in i) {
      ii.isFree = true;
      ii.isWall = false;
      ii.isDoor = false;
    }
  }
}

// Карты
// Чтобы создать новую карту:
// 1. Создать объект класса MapObject, задать имя
// 2. Прописать функцию для генерации:
//
// Обязательно в начале функции прописать clearMapLayout для новой карты
// В функции через индексы задаются флаги для клеток
// Доступные виды флагов можно посмотреть в models/tile_object.dart
MapObject mapHome = MapObject('Дом', emptyMap, generateMap1, [player]);
MapObject mapForest1 = MapObject('Лес1', emptyMap, generateMap2, []);
MapObject mapForest2 = MapObject('Лес2', emptyMap, generateMap3, []);

// Функции генерации карт
// При работе с картами:
// Первая координата - Y
// Вторая координата - X
void generateMap1() {
  mapHome.westMap = mapForest1;
  mapHome.eastMap = mapForest2;
  clearMapLayout(mapHome);

  mapHome.layout[0][2].isFree = false;
  mapHome.layout[0][2].isWall = true;

  mapHome.layout[1][2].isFree = false;
  mapHome.layout[1][2].isWall = true;

  mapHome.layout[2][2].isFree = false;
  mapHome.layout[2][2].isWall = true;

  mapHome.layout[3][2].isFree = false;
  mapHome.layout[3][2].isWall = true;

  mapHome.layout[4][2].isFree = false;
  mapHome.layout[4][2].isWall = true;

  mapHome.layout[0][3].isFree = false;
  mapHome.layout[0][3].isWall = true;

  mapHome.layout[0][4].isFree = false;
  mapHome.layout[0][4].isWall = true;

  mapHome.layout[0][5].isFree = false;
  mapHome.layout[0][5].isWall = true;

  mapHome.layout[0][6].isFree = false;
  mapHome.layout[0][6].isWall = true;

  mapHome.layout[1][6].isFree = false;
  mapHome.layout[1][6].isWall = true;

  mapHome.layout[2][6].isFree = false;
  mapHome.layout[2][6].isWall = true;

  mapHome.layout[3][6].isFree = false;
  mapHome.layout[3][6].isWall = true;

  mapHome.layout[4][6].isFree = false;
  mapHome.layout[4][6].isWall = true;

  mapHome.layout[4][5].isFree = false;
  mapHome.layout[4][5].isWall = true;

  mapHome.layout[4][3].isFree = false;
  mapHome.layout[4][3].isWall = true;

  mapHome.layout[4][4].isDoor = true;
}

void generateMap2() {
  mapForest1.eastMap = mapHome;
  clearMapLayout(mapForest1);
}

void generateMap3() {
  mapForest2.westMap = mapHome;
  clearMapLayout(mapForest1);
}
