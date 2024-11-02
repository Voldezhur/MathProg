import 'package:scientific_calculator/components/function_button.dart';
import 'package:scientific_calculator/components/number_button.dart';
import 'package:scientific_calculator/globals/calculator_functions.dart';
import 'package:scientific_calculator/models/equation_item.dart';
import 'package:flutter/material.dart';
import 'package:eval_ex/expression.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List equation = <String>[];
  String equationString = '';
  String displayString = '';

  final List numbers = [7, 8, 9, 4, 5, 6, 1, 2, 3, 0];

  void _addToEquation(EquationItem element) {
    setState(() {
      // Если последний элемент в выражении - число, то просто прибавляем цифру к нему
      if (equation.isNotEmpty &&
          isNumeric(equation.last) &&
          isNumeric(element.string)) {
        equation.last += element.string;
      }

      // Иначе добавляем новый элемент в конец списка
      else {
        equation.insert(equation.length, element.string);
      }

      // Обновляем строку на выводе
      equationString = equation.join();
    });
  }

  void _removeFromEquation() {
    setState(() {
      if (equation.isNotEmpty && equation.isNotEmpty) {
        // Если последний элемент списка - число, то просто удаляем цифру от него
        if (isNumeric(equation.last)) {
          equation.last = equation.last.substring(0, equation.last.length - 1);
        }

        // Иначе удаляем последний элемент списка
        else {
          equation.removeLast();
        }

        // Обновляем строку на выводе
        equationString = equation.join();
      }
    });
  }

  void _clearEquation() {
    setState(() {
      equation = [];
      equationString = equation.join();
    });
  }

  bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  String _preprocessEquation(List equation) {
    // Проходимся по всем элементам массива
    for (var i = 0; i < equation.length; i++) {
      // Если нашли функцию
      if (!isNumeric(equation[i]) && equation[i].length > 1) {
        String func = equation[i];

        // Если функция принимает один аргумент
        if (func[0] == '1') {
          // Обрезаем количество аргументов
          func = func.substring(1, func.length);

          // Берем следующее число в качестве аргумента
          if (i + 1 < equation.length) {
            // Вводим аргумент под скобки
            func = func.substring(0, func.length - 2) + equation[i + 1] + ')';

            // Удаляем лишнее число из выражения
            equation[i] = func;
            equation.removeAt(i + 1);
          }
        }

        // Если функция принимает два аргумента
        if (func[0] == '2') {}
      }
    }

    return equation.join();
  }

  void _displayResult() {
    setState(() {
      equationString = _preprocessEquation(equation);
      Expression exp = Expression(equationString);
      equationString = exp.eval().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Научный калькулятор'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  equationString,
                  style: const TextStyle(fontSize: 26),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2,
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
                      width: MediaQuery.sizeOf(context).width / 4,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: calculatorFunctions.length,
                        itemBuilder: (context, index) {
                          return FunctionButton(
                            itemIndex: index,
                            addToEquation: _addToEquation,
                          );
                        },
                      ),
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
