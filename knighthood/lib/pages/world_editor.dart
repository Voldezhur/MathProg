import 'package:flutter/material.dart';
import 'package:knighthood/globals/consts.dart';
import 'package:knighthood/globals/game_state.dart';
import 'package:knighthood/models/entity.dart';
import 'package:knighthood/models/tile_object.dart';
import 'package:knighthood/pages/game_screen.dart';
import 'package:knighthood/widgets/map.dart';
import 'package:knighthood/widgets/tile.dart';

class WorldEditor extends StatefulWidget {
  const WorldEditor({super.key});

  @override
  State<WorldEditor> createState() => _WorldEditorState();
}

List<List<TileObject>> customLayout = [
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

class _WorldEditorState extends State<WorldEditor> {
  var selectedTileIndex = 1;
  var selectedTile = tileFree;

  void _selectTile(index, tile) {
    setState(() {
      selectedTileIndex = index;
      selectedTile = tile;
    });
  }

  void _setTile(y, x) {
    setState(() {
      customLayout[y][x] = selectedTile;

      // Добавление энтити
      // Игрок
      if (selectedTile.isPlayer) {
        player.posX = x;
        player.posY = y;
        customMap.entities.add(player);
      }
      // Кабан
      if (selectedTile.isBoar) {
        customMap.entities.add(Entity(name: 'boar', posX: x, posY: y, isEnemy: true));
      }
    });
  }

  void _goToCustomMap() {
    currentMap = customMap;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GameScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактор мира'),
      ),
      body: Column(
        children: [
          Map(
            size: customMap.layout.length,
            map: customMap.layout,
            tileOnTap: _setTile,
          ),
          // Кнопки для выбора клетки
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.1,
                height: MediaQuery.sizeOf(context).width * 0.1,
                child: Tile(
                  tile: tileFree,
                  tileOnTap: () => _selectTile(1, tileFree),
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.1,
                height: MediaQuery.sizeOf(context).width * 0.1,
                child: Tile(
                  tile: tilePlayer,
                  tileOnTap: () => _selectTile(2, tilePlayer),
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.1,
                height: MediaQuery.sizeOf(context).width * 0.1,
                child: Tile(
                  tile: tileWall,
                  tileOnTap: () => _selectTile(3, tileWall),
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.1,
                height: MediaQuery.sizeOf(context).width * 0.1,
                child: Tile(
                  tile: tileDoor,
                  tileOnTap: () => _selectTile(4, tileDoor),
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.1,
                height: MediaQuery.sizeOf(context).width * 0.1,
                child: Tile(
                  tile: tileBoar,
                  tileOnTap: () => _selectTile(5, tileBoar),
                ),
              ),
            ],
          ),
          Text('Выбранная клетка: $selectedTileIndex'),
          ElevatedButton(
            onPressed: _goToCustomMap,
            child: const Text('Перейти на карту'),
          ),
        ],
      ),
    );
  }
}
