// Список всех доступных функций
// Потом через GridView все они выстраиваются в кнопки

import 'package:scientific_calculator/models/equation_item.dart';

final List<EquationItem> additionalFunctions = <EquationItem>[
  EquationItem('%', '%'),
  EquationItem('LOG(', 'ln'),
  EquationItem('LOG10(', 'log10'),
  EquationItem('SIN(', 'sin'),
  EquationItem('COS(', 'cos'),
  EquationItem('TAN(', 'tan'),
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
  EquationItem(',', ','),
  EquationItem('.', '.'),
];

final List memory = [null, null, null];
