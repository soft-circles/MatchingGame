class TileBoard {
  Tile[] tiles;
  int boardRows;
  int boardColumns;
  int index = 0;
  
  // Constructor
  TileBoard (Tile[] tempTiles, int _boardColumns, int _boardRows) {
    tiles = tempTiles;
    boardRows = _boardRows;
    boardColumns = _boardColumns;
  }
  
  // Display board
  void display() {
    for(int i = 0; i < tiles.length; i++) {
        tiles[i].display();
      }
  }
}