import 'package:scientific_calculator/models/equation_item.dart';
import 'package:flutter/material.dart';

class NumberButton extends StatefulWidget {
  const NumberButton(
      {super.key, required this.number, required this.addToEquation});

  final int number;
  final Function addToEquation;

  @override
  State<NumberButton> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
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
        widget.addToEquation(
            EquationItem(widget.number.toString(), widget.number.toString()));
      },
      child: Text(
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        widget.number.toString(),
      ),
    );
  }
}
