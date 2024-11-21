import 'package:battleship/models/field_item.dart';
import 'package:battleship/widgets/field.dart';
import 'package:flutter/material.dart';

class FieldSetting extends StatefulWidget {
  const FieldSetting({super.key, required this.field, required this.setField});

  final List<List<FieldItem>> field;
  final Function setField;

  @override
  State<FieldSetting> createState() => _FieldSettingState();
}

class _FieldSettingState extends State<FieldSetting> {
  @override
  Widget build(BuildContext context) {
    return Field(size: 7, field: widget.field);
  }
}
