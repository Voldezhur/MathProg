import 'package:scientific_calculator/components/function_button.dart';
import 'package:scientific_calculator/components/memory_button.dart';
import 'package:scientific_calculator/components/number_button.dart';
import 'package:scientific_calculator/globals/lists.dart';
import 'package:scientific_calculator/models/equation_item.dart';
import 'package:flutter/material.dart';
import 'package:eval_ex/expression.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color equationTextColor = Colors.black;
  String equation = '';

  final List numbers = [7, 8, 9, 4, 5, 6, 1, 2, 3, 0];

  void _addToEquation(EquationItem element) {
    setState(() {
      equationTextColor = Colors.black;
      equation += element.string;
    });
  }

  void _removeFromEquation() {
    setState(() {
      equationTextColor = Colors.black;
      if (equation.isNotEmpty) {
        equation = equation.substring(0, equation.length - 1);
      }
    });
  }

  void _clearEquation() {
    setState(() {
      equation = "";
    });
  }

  void _displayResult() {
    setState(() {
      Expression exp = Expression(equation);
      try {
        equation = exp.eval().toString();
      } catch (e) {
        equationTextColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(top: 8),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 228, 212, 255),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    equation,
                    style: TextStyle(
                      fontSize: 26,
                      color: equationTextColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 10,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: additionalFunctions.length,
                        itemBuilder: (context, index) {
                          return FunctionButton(
                            itemIndex: index,
                            addToEquation: _addToEquation,
                            functionList: additionalFunctions,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 4.5,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return NumberButton(
                            number: numbers[index],
                            addToEquation: _addToEquation,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 10,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: mainFunctions.length,
                        itemBuilder: (context, index) {
                          return FunctionButton(
                            itemIndex: index,
                            addToEquation: _addToEquation,
                            functionList: mainFunctions,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 10,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: utilityFunctions.length,
                        itemBuilder: (context, index) {
                          return FunctionButton(
                            itemIndex: index,
                            addToEquation: _addToEquation,
                            functionList: utilityFunctions,
                          );
                        },
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            _removeFromEquation();
                          },
                          icon: const Icon(Icons.square_outlined),
                        ),
                        IconButton(
                          onPressed: () {
                            _displayResult();
                          },
                          icon: const Icon(Icons.square_rounded),
                        ),
                        IconButton(
                          onPressed: _clearEquation,
                          icon: const Icon(Icons.delete_forever),
                        ),
                        MemoryButton(
                          index: 1,
                          addToEquation: _addToEquation,
                        ),
                        MemoryButton(
                          index: 2,
                          addToEquation: _addToEquation,
                        ),
                        MemoryButton(
                          index: 3,
                          addToEquation: _addToEquation,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
