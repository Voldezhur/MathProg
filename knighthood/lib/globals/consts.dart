import 'package:knighthood/models/tile_object.dart';

// Создание клеток
TileObject tileFree = TileObject();
TileObject tilePlayer = TileObject(isPlayer: true);
TileObject tileWall = TileObject(isFree: false, isWall: true);
TileObject tileDoor = TileObject(isDoor: true);
TileObject tileBoar = TileObject(isBoar: true);

List<List<TileObject>> emptyMap = [
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
