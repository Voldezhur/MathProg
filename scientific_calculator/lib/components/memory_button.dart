import 'package:flutter/material.dart';

class MemoryButton extends StatefulWidget {
  const MemoryButton(
      {super.key, required this.index, required this.addToEquation});

  final int index;
  final Function addToEquation;

  @override
  State<MemoryButton> createState() => _MemoryButtonState();
}

class _MemoryButtonState extends State<MemoryButton> {
  void _onPressed() {}

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _onPressed,
      child: Text("M${widget.index}"),
    );
  }
}
