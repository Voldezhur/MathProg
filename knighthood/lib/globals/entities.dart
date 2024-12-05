import 'package:knighthood/models/entity.dart';

// При работе с энтити:
// Первая координата - X
// Вторая координата - Y
Entity player = Entity('player', 4, 2, -1, -1, false);
Entity boar = Entity('boar', 0, 0, -1, -1, true);

// Функции энтити
// Функция поиска ближейшего пути энтити до игрока
// Алгоритм A*
// https://www.geeksforgeeks.org/a-search-algorithm/

