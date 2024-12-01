import 'package:flutter/material.dart';

class WorldEditor extends StatefulWidget {
  const WorldEditor({super.key});

  @override
  State<WorldEditor> createState() => _WorldEditorState();
}

class _WorldEditorState extends State<WorldEditor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактор мира'),
      ),
    );
  }
}
