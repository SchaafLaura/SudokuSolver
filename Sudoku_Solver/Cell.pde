class Cell {
  int digit = -1;

  public Cell() {
  }

  public Cell(int digit) {
    this.digit = digit;
  }
}

/*
class Cell {
  boolean hasDigit;
  int digit;
  int row;
  int col;
  PVector pos;
  PVector[] rowNeighbors;
  PVector[] colNeighbors;
  PVector[] boxNeighbors;
  PVector[] dg1Neighbors; // diagonal with positive slope
  PVector[] dg2Neighbors; // diagonal with negative slope

  int[] possibleDigits;


  public PVector[] getRowNeighbors() {
    return rowNeighbors.clone();
  }

  public PVector[] getColNeighbors() {
    return colNeighbors.clone();
  }

  public PVector[] getBoxNeighbors() {
    return boxNeighbors.clone();
  }

  public PVector[] getDg1Neighbors() {
    return dg1Neighbors.clone();
  }

  public PVector[] getDg2Neighbors() {
    return dg2Neighbors.clone();
  }

  public int getDigit() {
    if (hasDigit) {
      return digit;
    } else {
      return 0;
    }
  }

  public void removePossibility(int num) {
    int[] newPossibilities = new int[possibleDigits.length];
    int k = 0;
    for (int i = 0; i < possibleDigits.length; i++) {
      if (possibleDigits[i] != num) {
        newPossibilities[k] = possibleDigits[i];
        k++;
      }
    }
    possibleDigits = newPossibilities;
  }

  public int[] getPossibleDigits() {
    if (hasDigit) {
      return new int[0];
    } else {
      if (possibleDigits == null) {
        possibleDigits = new int[9];
        for (int i = 0; i < 9; i++) {
          possibleDigits[i] = i + 1;
        }
        return possibleDigits;
      } else {
        return possibleDigits;
      }
    }
  }

  public boolean setDigit(int x) {
    if (hasDigit) {
      return false;
    } else {
      this.digit = x;
      hasDigit = true;
      return true;
    }
  }

  public Cell(int col, int row) {
    this.row = row;
    this.col = col;
    this.pos = new PVector(col, row);
    initNeighbors();
    initPossibleDigits();
  }
  public Cell(int col, int row, int digit) {
    this.row = row;
    this.col = col;
    this.pos = new PVector(col, row);
    setDigit(digit);
    initNeighbors();
  }

  public void initPossibleDigits() {
    possibleDigits = new int[9];
    for (int i = 0; i < 9; i++) {
      possibleDigits[i] = i + 1;
    }
  }

  private void initNeighbors() {
    initColNeighbors(); // column
    initRowNeighbors(); // row
    initBoxNeighbors(); // box
    initDg1Neighbors(); // positive slope diagonal
    initDg2Neighbors(); // negative slope diagonal
  }

  private void initColNeighbors() {
    colNeighbors = new PVector[8];
    int k = 0;
    for (int i = 0; i < 9; i++) {
      if (i != row) {
        colNeighbors[k] = new PVector(col, i);
        k++;
      }
    }
  }

  private void initRowNeighbors() {
    rowNeighbors = new PVector[8];
    int k = 0;
    for (int i = 0; i < 9; i++) {
      if (i != col) {
        rowNeighbors[k] = new PVector(i, row);
        k++;
      }
    }
  }

  private void initBoxNeighbors() {
    boxNeighbors = new PVector[8];

    // figure out top left cell of box
    int xStart = floor(col/3) * 3;
    int yStart = floor(row/3) * 3;
    int k = 0;
    for (int i = xStart; i < xStart + 3; i++) {
      for (int j = yStart; j < yStart + 3; j++) {
        if (!(i == col && j == row)) {
          boxNeighbors[k] = new PVector(i, j);
          k++;
        }
      }
    }
  }

  private void initDg1Neighbors() {
    dg1Neighbors = new PVector[row + col < 8 ? row + col : 16 - col - row];
    int k = 1;
    int index = 0;
    PVector start = new PVector(col, row);
    if ((row + col < 8 ? row + col : 16 - col - row) > 0) {
      while (start.x + k < 9 && start.y - k >= 0) {
        dg1Neighbors[index] = new PVector(start.x + k, start.y - k);
        k++;
        index++;
      }
      k = 1;
      while (start.x - k >= 0 && start.y + k < 9) {
        dg1Neighbors[index] = new PVector(start.x - k, start.y + k);
        k++;
        index++;
      }
    }
  }

  private void initDg2Neighbors() {
    dg2Neighbors = new PVector[row >= col ? col - row + 8 : row - col + 8];
    int k = 1;
    int index = 0;
    PVector start = new PVector(col, row);
    while (start.x + k < 9 && start.y + k < 9) {
      dg2Neighbors[index] = new PVector(start.x + k, start.y + k);
      k++;
      index++;
    }
    k = 1;
    while ( start.x - k >= 0 && start.y - k >= 0) {
      dg2Neighbors[index] = new PVector(start.x - k, start.y - k);
      k++;
      index++;
    }
  }
}
*/
