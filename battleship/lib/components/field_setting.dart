import 'package:battleship/widgets/field_tile.dart';
import 'package:flutter/material.dart';

class FieldSetting extends StatefulWidget {
  const FieldSetting({super.key, required this.field, required this.setField});

  final List<List<FieldTile>> field;
  final Function setField;

  @override
  State<FieldSetting> createState() => _FieldSettingState();
}

class _FieldSettingState extends State<FieldSetting> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
