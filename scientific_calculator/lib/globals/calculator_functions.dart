// Список всех доступных функций
// Потом через GridView все они выстраиваются в кнопки

import 'package:scientific_calculator/models/equation_item.dart';

const logString = 'LOG(';

final List<EquationItem> additionalFunctions = <EquationItem>[
  EquationItem(logString, 'logn'),
  EquationItem('(', '('),
  EquationItem(')', ')'),
];

final List<EquationItem> mainFunctions = <EquationItem>[
  EquationItem('+', '+'),
  EquationItem('-', '-'),
  EquationItem('*', '*'),
  EquationItem('/', '/'),
  EquationItem('^', '^'),
];
