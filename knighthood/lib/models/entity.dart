class Entity {
  String name;

  int posX;
  int posY;
  int prevPosX;
  int prevPosY;

  bool isEnemy;

  Entity(this.name, this.posX, this.posY, this.prevPosX, this.prevPosY,
      this.isEnemy);
}
