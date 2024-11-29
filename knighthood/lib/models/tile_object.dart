class TileObject {
  bool isFree;
  bool isPlayer;
  bool isWall;
  bool isDoor;

  TileObject({
    this.isFree = true,
    this.isPlayer = false,
    this.isWall = false,
    this.isDoor = false,
  });
}
