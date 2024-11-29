import 'package:knighthood/models/tile_object.dart';

class MapObject {
  String name;
  List<List<TileObject>> layout;

  late MapObject northMap;
  late MapObject westMap;
  late MapObject southMap;
  late MapObject eastMap;

  MapObject(
    this.name,
    this.layout, {
    northMap,
    westMap,
    southMap,
    eastMap,
  });
}
