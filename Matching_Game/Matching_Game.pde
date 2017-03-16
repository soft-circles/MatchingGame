Tile[] tiles; // A 2D array of tile objects //<>//
TileBoard tileBoard; // Tileboard obj
int rows = 2; // User-specified # of rows
int columns = 2; // User-specified # of columns
int boardSize;
int index;
color[] tileColors;
color[] finalColors;
int numberSelected;
Tile selected;
Tile secondSelected;
boolean pairSelected;
boolean isMatch;
int matchCounter;
PFont f;


void setup () {
  size(400, 400);
  f = createFont("Georgia", 24, true);
  textSize(24);
  pairSelected = false;
  colorSetup();
}

void draw () {
  background(0);
  if (!allMatched()) {
    tileBoard.display();
  } else {
    gameOver();
  }
}

boolean allMatched () {
  for (int i = 0; i < tiles.length; i++) {
    if (matchCounter == rows*columns) {
      return true;
    }
  }
  return false;
}

void gameOver() {
  fill(255);
  textAlign(CENTER);
  text("You won! \n Press the spacebar to play again", width/2, height/2);
}

void keyPressed() {
  if (keyCode == ' ' && allMatched()) {
    matchCounter = 0;
    colorSetup();
  }
}

void mousePressed() {
  // loop through tile array
  // flip the selected tile
  // if  the number of flipped tiles is greater than 2, reset all the tiles
  // after tiles have been flipped run matchFunction
  for (int i = 0; i < tiles.length; i++) {
    tiles[i].flip(mouseX, mouseY);
    ResetSet();
  }

  matchFunction();
  // if the selected tiles are a match
  // move the selected tiles off screen
  // reset the board **need to look at ResetSet in this context for double clicking problem**
  if (isMatch) {
    for (int i = 0; i < tiles.length; i++) {
      if (pairSelected && selected.isSameColor(tiles[i])) {
        tiles[i].matched = true;
        matchCounter++;
        ResetSet();
        // allows user to click the next tile without having to double click
        if (numberSelected == 2) {
          numberSelected++;
        }
      }
    }
  }
}


// Return true if selected tiles are a match
// otherwise return false
boolean matchFunction () {
  for (int i = 0; i < tiles.length; i++) {
    // if the tile is flipped, selected is not null, there is no pair selected,
    // and the currently selected tile is not the same as the previously selected tile
    // secondSelected is filled with the currently selected tile
    if (tiles[i].flipped && selected != null && !pairSelected && tiles[i].numID != selected.numID) {
      secondSelected = tiles[i];
      pairSelected = true; // a set of 2 tiles have been selected
      // if the first selected tile is the same color as the second selected tile
      // return true otherwise, return false
      if (selected.isSameColor(secondSelected)) {
        isMatch = true;
        return isMatch;
      } else {
        isMatch = false;
      }
    }
    // if tile is flipped, secondSelected is null and the number of selected tiles is less than 2
    // the currently selected tile is saved in selected
    if (tiles[i].flipped && secondSelected == null && numberSelected < 2) {
      selected = tiles[i];
    }
  }
  return isMatch;
}

// Reset the values of selected tiles
void ResetSet () {
  if (numberSelected > 2) {
    secondSelected = null;
    selected = null;
    pairSelected = false;
    for (int j = 0; j < tiles.length; j++) {
      tiles[j].resetTiles();
    }
  }
}