// Класс для алгоритма A*
// https://www.geeksforgeeks.org/a-search-algorithm/
import 'package:knighthood/globals/entities.dart';
import 'package:knighthood/globals/game_state.dart';

class Cell {
  int parentI;
  int parentJ;

  double F;
  double g;
  double h;

  Cell(
    this.parentI,
    this.parentJ, {
    this.F = 0,
    this.g = 0,
    this.h = 0,
  });
}

// При работе с картами, координаты в порядке YX, а не XY

// Проверка, что клетка в пределах карты
bool isValid(y, x) {
  int mapSize = currentMap.layout.length;
  return (y >= 0) && (y < mapSize) && (x >= 0) && (x < mapSize);
}

// Проверка, что клетка является целью
bool isDestination(y, x) {
  return (y == player.posY) && (x == player.posX);
}

// Манхеттенское расстояние
num manhattan(y, x) {
  return (y - player.posY).abs() + (x - player.posX).abs();
}
