// Список всех доступных функций
// Потом через GridView все они выстраиваются в кнопки

import 'package:scientific_calculator/models/equation_item.dart';

final List<EquationItem> additionalFunctions = <EquationItem>[
  EquationItem('LOG(', 'logn'),
];

final List<EquationItem> mainFunctions = <EquationItem>[
  EquationItem('+', '+'),
  EquationItem('-', '-'),
  EquationItem('*', '*'),
  EquationItem('/', '/'),
  EquationItem('^', '^'),
];

final List<EquationItem> utilityFunctions = <EquationItem>[
  EquationItem('(', '('),
  EquationItem(')', ')'),
];

final List memory = [0, 0, 0];
