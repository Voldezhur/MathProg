import 'package:scientific_calculator/globals/calculator_functions.dart';
import 'package:flutter/material.dart';

class FunctionButton extends StatefulWidget {
  const FunctionButton(
      {super.key, required this.itemIndex, required this.addToEquation});

  final int itemIndex;
  final Function addToEquation;

  @override
  State<FunctionButton> createState() => _FunctionButtonState();
}

class _FunctionButtonState extends State<FunctionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      onPressed: () {
        widget.addToEquation(calculatorFunctions[widget.itemIndex]);
      },
      child: Text(
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        calculatorFunctions[widget.itemIndex].label,
      ),
    );
  }
}
