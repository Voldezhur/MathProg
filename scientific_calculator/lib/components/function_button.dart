import 'package:flutter/material.dart';
import 'package:scientific_calculator/models/equation_item.dart';

class FunctionButton extends StatefulWidget {
  const FunctionButton(
      {super.key,
      required this.itemIndex,
      required this.addToEquation,
      required this.functionList});

  final int itemIndex;
  final Function addToEquation;
  final List<EquationItem> functionList;

  @override
  State<FunctionButton> createState() => _FunctionButtonState();
}

class _FunctionButtonState extends State<FunctionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        widget.addToEquation(widget.functionList[widget.itemIndex]);
      },
      child: Text(
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        widget.functionList[widget.itemIndex].label,
      ),
    );
  }
}
