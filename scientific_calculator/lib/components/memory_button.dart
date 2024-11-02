import 'package:flutter/material.dart';
import 'package:scientific_calculator/globals/lists.dart';

class MemoryButton extends StatefulWidget {
  const MemoryButton(
      {super.key,
      required this.index,
      required this.addToEquation,
      required this.equation});

  final int index;
  final Function addToEquation;
  final String equation;

  @override
  State<MemoryButton> createState() => _MemoryButtonState();
}

bool isNumeric(String s) {
  return double.tryParse(s) != null;
}

class _MemoryButtonState extends State<MemoryButton> {
  void _onPressed() {
    if (memory[widget.index] != null) {
      widget.addToEquation(memory[widget.index]);
    } else if (isNumeric(widget.equation) && widget.equation.isNotEmpty) {
      memory[widget.index] = widget.equation;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {_onPressed()},
      child: Text("M${widget.index}"),
    );
  }
}
