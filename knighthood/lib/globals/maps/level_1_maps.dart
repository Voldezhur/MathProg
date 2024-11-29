import 'package:knighthood/models/tile_object.dart';

// Карты
List<List<TileObject>> map1 = [
  [
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
  ],
  [
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
  ],
  [
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
  ],
  [
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
  ],
  [
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
  ],
  [
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
  ],
  [
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
  ],
  [
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
  ],
  [
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
  ],
  [
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
    TileObject(),
  ],
];

// Функции генерации карт
// Первая координата - Y
// Вторая координата - X
void generateMap1() {
  map1[0][2].isFree = false;
  map1[0][2].isWall = true;

  map1[1][2].isFree = false;
  map1[1][2].isWall = true;

  map1[2][2].isFree = false;
  map1[2][2].isWall = true;

  map1[3][2].isFree = false;
  map1[3][2].isWall = true;

  map1[4][2].isFree = false;
  map1[4][2].isWall = true;

  map1[0][3].isFree = false;
  map1[0][3].isWall = true;

  map1[0][4].isFree = false;
  map1[0][4].isWall = true;

  map1[0][5].isFree = false;
  map1[0][5].isWall = true;

  map1[0][6].isFree = false;
  map1[0][6].isWall = true;

  map1[1][6].isFree = false;
  map1[1][6].isWall = true;

  map1[2][6].isFree = false;
  map1[2][6].isWall = true;

  map1[3][6].isFree = false;
  map1[3][6].isWall = true;

  map1[4][6].isFree = false;
  map1[4][6].isWall = true;

  map1[4][5].isFree = false;
  map1[4][5].isWall = true;

  map1[4][3].isFree = false;
  map1[4][3].isWall = true;

  map1[4][4].isDoor = true;
}
