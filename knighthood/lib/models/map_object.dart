import 'package:knighthood/models/tile_object.dart';

class MapObject {
  String name;
  List<List<TileObject>> layout;

  Function generateMap;

  MapObject? northMap;
  MapObject? westMap;
  MapObject? southMap;
  MapObject? eastMap;

  MapObject(
    this.name,
    this.layout,
    this.generateMap, {
    northMap,
    westMap,
    southMap,
    eastMap,
  });
}
