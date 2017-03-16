void colorSetup() {
  index = 0; // set index to 0
  int w = width / columns;
  int h = height / rows;
  boardSize = rows * columns; // calculate size of the board
  tiles = new Tile[boardSize]; // Create an array of tiles based on boardSize
  tileBoard = new TileBoard(tiles, rows, columns); // Create a tileboard that takes an array of tiles, user-specified number of rows + columns
  // Create and define colors
  int counter = 0; // counter for for loop
  tileColors = new color[boardSize/2];
  
  // Set random colors for tileColor array
  for (int i = 0; i < tileColors.length; i++){
    tileColors[i] = color (random(255), random(255), random(255));
  }
  finalColors = new color[tileColors.length*2]; // Defining length of finalColors array
  
  // Make pairs of colors inside finalColor array
  for (int i = 0; i < tileColors.length; i++) {
    finalColors[counter] = tileColors[i];
    finalColors[++counter] = tileColors[i];
    counter++;
  }
  
  // Shuffle pairs of colors
  for(int i = 0; i < finalColors.length-1; i++){
    int temp = finalColors[i];
    // pick a random location in finalColors
    int rand = (int)random(finalColors.length);
    finalColors[i] = finalColors[rand];
    finalColors[rand] = temp;
  }
  
  // Create X,Y array of tile objects
  for (int x = 0; x < rows; x++) {
    for (int y = 0; y < columns; y++) {
           tiles[index] = new Tile(x*w, y*h, finalColors[index], index);
           index++;
    }
  }
}