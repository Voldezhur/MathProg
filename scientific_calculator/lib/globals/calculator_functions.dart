// Список всех доступных функций
// Потом через GridView все они выстраиваются в кнопки

import 'package:scientific_calculator/models/calculator_function.dart';

const logString = '1LOG(a)';

final List<CalculatorFunction> calculatorFunctions = <CalculatorFunction>[
  CalculatorFunction('+', '+'),
  CalculatorFunction('-', '-'),
  CalculatorFunction('*', '*'),
  CalculatorFunction('/', '/'),
  CalculatorFunction('^', '^'),
  CalculatorFunction(logString, 'logn'),
];
