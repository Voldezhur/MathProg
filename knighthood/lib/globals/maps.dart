import 'package:knighthood/globals/consts.dart';
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
MapObject map1 = MapObject('Дом', emptyMap, generateMap1);
MapObject map2 = MapObject('Лес1', emptyMap, generateMap2);

// Функции генерации карт
// При работе с картами:
// Первая координата - Y
// Вторая координата - X
void generateMap1() {
  map1.westMap = map2;
  clearMapLayout(map1);

  map1.layout[0][2].isFree = false;
  map1.layout[0][2].isWall = true;

  map1.layout[1][2].isFree = false;
  map1.layout[1][2].isWall = true;

  map1.layout[2][2].isFree = false;
  map1.layout[2][2].isWall = true;

  map1.layout[3][2].isFree = false;
  map1.layout[3][2].isWall = true;

  map1.layout[4][2].isFree = false;
  map1.layout[4][2].isWall = true;

  map1.layout[0][3].isFree = false;
  map1.layout[0][3].isWall = true;

  map1.layout[0][4].isFree = false;
  map1.layout[0][4].isWall = true;

  map1.layout[0][5].isFree = false;
  map1.layout[0][5].isWall = true;

  map1.layout[0][6].isFree = false;
  map1.layout[0][6].isWall = true;

  map1.layout[1][6].isFree = false;
  map1.layout[1][6].isWall = true;

  map1.layout[2][6].isFree = false;
  map1.layout[2][6].isWall = true;

  map1.layout[3][6].isFree = false;
  map1.layout[3][6].isWall = true;

  map1.layout[4][6].isFree = false;
  map1.layout[4][6].isWall = true;

  map1.layout[4][5].isFree = false;
  map1.layout[4][5].isWall = true;

  map1.layout[4][3].isFree = false;
  map1.layout[4][3].isWall = true;

  map1.layout[4][4].isDoor = true;
}

void generateMap2() {
  map2.eastMap = map1;
  clearMapLayout(map2);
}
