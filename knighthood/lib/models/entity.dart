import 'package:knighthood/globals/entities.dart';
import 'package:knighthood/globals/game_state.dart';
import 'package:knighthood/models/cell.dart';

class Entity {
  String name;

  int posX;
  int posY;
  int prevPosX;
  int prevPosY;

  bool isEnemy;

  Entity(this.name, this.posX, this.posY, this.prevPosX, this.prevPosY,
      this.isEnemy);

  // Алгоритм поиска пути до цели A*
  void aStar() {
    // Проверка возможности добраться до точки назначения
    if (!isValid(posY, posX) || !isValid(player.posY, player.posX)) return;

    // Проверка, что мы уже у цели
    if (isDestination(posY, posX)) return;

    // Инициализация списка с информацией о клетках
    List<List<bool>> closedList = [];
    for (int ii = 0; ii < currentMap.layout.length; ii++) {
      closedList.add([]);
      for (int iii = 0; iii < currentMap.layout.length; iii++) {
        closedList[ii].add(false);
      }
    }

    // Инициализация списка с информацией о клетках
    List<List<Cell>> cellDetails = [];
    for (int ii = 0; ii < currentMap.layout.length; ii++) {
      cellDetails.add([]);
      for (int iii = 0; iii < currentMap.layout.length; iii++) {
        cellDetails[ii].add(Cell(0, 0));
      }
    }

    int i = posY;
    int j = posX;
    cellDetails[i][j].F = 0;
    cellDetails[i][j].g = 0;
    cellDetails[i][j].g = 0;
    cellDetails[i][j].parentI = i;
    cellDetails[i][j].parentJ = j;

    // Инициализация открытого списка
    List openList = [];
    openList.add([0, i, j]); // Синтаксис как в туториале

    // Главный цикл
    while (openList.isNotEmpty) {
      // Выбираем клетку с наименьшим значением F из открытого списка
      var p = openList.removeLast();

      // Помечаем клетку, как посещенную
      i = p[1];
      j = p[2];
      closedList[i][j] = true;

      // Потомки клетки - соседние клетки, до которых мы можем дойти
      // Проверяем потомков клетки в каждом направлении
      List directions = [
        [1, 0],
        [0, 1],
        [-1, 0],
        [0, -1]
      ];
      for (var dir in directions) {
        int newI = (i + dir[0]).toInt();
        int newJ = (j + dir[1]).toInt();

        // Если потомок в пределах карты и не был посещен:
        if (isValid(newI, newJ) && !closedList[newI][newJ]) {
          // Если потомок является целью
          if (isDestination(newI, newJ)) {
            // Меняем родителя клетки - цели
            cellDetails[newI][newJ].parentI = i;
            cellDetails[newI][newJ].parentJ = j;

            // Обработка результатов поиска и вывод
            print('the path is: ');
            var path = [];
            int row = player.posY;
            int col = player.posX;

            // Проходим по пути из цели до отправной точки по родительским клеткам
            while (!(cellDetails[row][col].parentI == row &&
                cellDetails[row][col].parentJ == col)) {
              path.add((row, col));
              var tempRow = cellDetails[row][col].parentI;
              var tempCol = cellDetails[row][col].parentJ;

              row = tempRow;
              col = tempCol;
            }

            // Добавляем исходную клетку к пути
            path.add((row, col));
            // Переворачиваем путь, чтобы он шел от исходной клетки к цели
            path = path.reversed.toList();

            print(path);
          } else {
            // Подсчитываем F, g, h
            var newG = cellDetails[i][j].g + 1.0;
            var newH = manhattan(newI, newJ);
            var newF = newG + newH;

            // Если клетки нет в открытом списке или новое значение F меньше
            if (cellDetails[newI][newJ].F > newF ||
                cellDetails[newI][newJ].F == 0) {
              // Добавить ячейку к открытому списку
              openList.add([newF, newI, newJ]);
              // Обновить данные о клетке
              cellDetails[newI][newJ].F = newF;
              cellDetails[newI][newJ].g = newG;
              cellDetails[newI][newJ].h = newH.toDouble();
              cellDetails[newI][newJ].parentI = i;
              cellDetails[newI][newJ].parentJ = j;
            }
          }
        }
      }
    }
  }
}
