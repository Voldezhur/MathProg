import 'package:knighthood/globals/consts.dart';
import 'package:knighthood/models/map.dart';
import 'package:knighthood/models/tile_object.dart';

// Карты
List<List<TileObject>> layout1 = emptyMap;
List<List<TileObject>> layout2 = emptyMap;

// Функции генерации карт
// Первая координата - Y
// Вторая координата - X
void generateMap1() {
  layout1[0][2].isFree = false;
  layout1[0][2].isWall = true;

  layout1[1][2].isFree = false;
  layout1[1][2].isWall = true;

  layout1[2][2].isFree = false;
  layout1[2][2].isWall = true;

  layout1[3][2].isFree = false;
  layout1[3][2].isWall = true;

  layout1[4][2].isFree = false;
  layout1[4][2].isWall = true;

  layout1[0][3].isFree = false;
  layout1[0][3].isWall = true;

  layout1[0][4].isFree = false;
  layout1[0][4].isWall = true;

  layout1[0][5].isFree = false;
  layout1[0][5].isWall = true;

  layout1[0][6].isFree = false;
  layout1[0][6].isWall = true;

  layout1[1][6].isFree = false;
  layout1[1][6].isWall = true;

  layout1[2][6].isFree = false;
  layout1[2][6].isWall = true;

  layout1[3][6].isFree = false;
  layout1[3][6].isWall = true;

  layout1[4][6].isFree = false;
  layout1[4][6].isWall = true;

  layout1[4][5].isFree = false;
  layout1[4][5].isWall = true;

  layout1[4][3].isFree = false;
  layout1[4][3].isWall = true;

  layout1[4][4].isDoor = true;
}

// Объекты карт
MapObject map2 = MapObject('Лес1', layout2);
MapObject map1 = MapObject('Дом', layout1, westMap: map2);
