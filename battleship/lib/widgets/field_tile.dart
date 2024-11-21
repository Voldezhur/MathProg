import 'package:battleship/models/field_item.dart';
import 'package:flutter/material.dart';

class FieldTile extends StatefulWidget {
  const FieldTile({super.key, required this.tile});

  final FieldItem tile;

  @override
  State<FieldTile> createState() => _FieldTileState();
}

class _FieldTileState extends State<FieldTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
            color: widget.tile.tileColor,
            border: Border.all(color: Colors.brown)),
      ),
    );
  }
}
