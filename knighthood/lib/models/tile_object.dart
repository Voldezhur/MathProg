class TileObject {
  bool isFree; // true - можно пройти насквозь; false - нельзя
  bool isPlayer;
  bool isWall;
  bool isDoor;
  bool isBoar;

  TileObject({
    this.isFree = true,
    this.isPlayer = false,
    this.isWall = false,
    this.isDoor = false,
    this.isBoar = false,
  });
}


// Ловушка
// Дио Польнареф телепорт за варудо
// Подушка пердушка