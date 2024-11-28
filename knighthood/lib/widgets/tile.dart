import 'package:flutter/material.dart';
import 'package:knighthood/models/tile_object.dart';

class Tile extends StatefulWidget {
  const Tile({super.key, required this.tile});

  final TileObject tile;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
