class Tile {
  float xPos, yPos; // Location + width/height
  int numID;
  color col; // Color
  boolean flipped;
  boolean selected;
  color interColor;
  color startColor = color(255);
  boolean matched;
  int w = width / columns;
  int h = height / rows;

  // Constructor
  Tile (float tempX, float tempY, color c, int _numID) {
    xPos = tempX;
    yPos = tempY;
    numID = _numID;
    col = c;
    flipped = false;
    matched = false;
  }


  // Draw the tile
  void display() {
    rectMode(CORNER);
    stroke(0);
    if (flipped) {
      stroke(255);
      fill(col);
    } else if (matched) {
      noStroke();
      fill(0);
    } else {
      fill(255);
    }
    rect(xPos, yPos, w, h);
  }

  color getColor() {
    return col;
  }

  //flip tile and add 1 to the number of selected tiles
  void flip (int mx, int my) {
    if (mx > xPos && mx < xPos + w && my > yPos && my < yPos + h && !matched) {
      numberSelected++;
      flipped = !flipped;
    }
  }
  // reset the tiles by making flipped false and setting the number of selected tiles to 0  
  void resetTiles() {
    flipped = false;
    numberSelected = 0;
  }


  boolean isSameColor(final Tile t) {
    return col == t.col;
  }
}