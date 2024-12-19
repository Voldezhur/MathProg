import 'package:knighthood/globals/consts.dart';
import 'package:knighthood/globals/maps.dart';
import 'package:knighthood/models/entity.dart';
import 'package:knighthood/models/map_object.dart';
import 'package:knighthood/pages/world_editor.dart';

MapObject currentMap = mapHome;
MapObject customMap = MapObject('custom', customLayout, () {}, []);

Entity player = playerDefault;
