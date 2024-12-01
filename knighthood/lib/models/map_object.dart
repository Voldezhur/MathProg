import 'package:knighthood/models/entity.dart';
import 'package:knighthood/models/tile_object.dart';

class MapObject {
  String name;
  List<List<TileObject>> layout;

  Function generateMap;
  List<Entity> entities;

  MapObject? northMap;
  MapObject? westMap;
  MapObject? southMap;
  MapObject? eastMap;

  MapObject(
    this.name,
    this.layout,
    this.generateMap,
    this.entities, {
    northMap,
    westMap,
    southMap,
    eastMap,
  });
}
