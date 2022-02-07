class Grid {
  Cell[][] cells;
  int w = 9;
  int h = 9;

  public Grid() {
    initCells();
  }

  public Grid(int w, int h) {
    this.w = w;
    this.h = h;
    initCells();
  }

  private void initCells() {
    cells = new Cell[w][h];
    for (int i = 0; i < w; i++) {
      for (int j = 0; j < h; j++) {
        cells[i][j] = new Cell();
      }
    }
  }
  
  public int getDigitAtXY(int x, int y) {
    return cells[x][y].digit;
  }
  
  IntVector[] getColumIndices(int k) {
    IntVector[] ret = new IntVector[h];
    for (int i = 0; i < h; i++) {
      ret[i] = new IntVector(k, i);
    }
    return ret;
  }
  
  IntVector[] getRowIndices(int k) {
    IntVector[] ret = new IntVector[w];
    for (int i = 0; i < w; i++) {
      ret[i] = new IntVector(i, k);
    }
    return ret;
  }
  
  IntVector[] getPositiveDiagonalIndices(int k){
    int totalNumberOfDiagonals = w + h - 1;
    return null;
  }
  
}


/*class Grid {
  Cell[][] cells;
  //PVector[] highlights;
  Highlight[] highlights;
  Constraint[] constraints;

  public Grid() {
    cells = new Cell[9][9];
    //highlights = new PVector[0];
    highlights = new Highlight[0];
    constraints = new Constraint[0];
    initCells();
  }

  public void updatePossibilities() {

    for (int i = 0; i < constraints.length; i++) {

      Constraint c = constraints[i];
      if (c instanceof UniquenessConstraint) {
        for (int j = 0; j < c.cellIndices.length; j++) {
          Cell currentCell = G.cells[(int) c.cellIndices[j].x][(int) c.cellIndices[j].y];
          if (currentCell.hasDigit) {
            for (int k = 0; k < c.cellIndices.length; k++) {
              if (k != j) {
                G.cells[(int) c.cellIndices[k].x][(int) c.cellIndices[k].y].removePossibility(currentCell.getDigit());
              }
            }
          }
        }
      }
    }
  }


  PVector[] getDg1(int x, int y) {
    PVector[] ret = new PVector[(y + x < 8 ? y + x : 16 - x - y) + 1];
    int k = 0;
    int index = 0;
    PVector start = new PVector(x, y);
    if ((y + x < 8 ? y + x : 16 - x - y) > 0) {
      while (start.x + k < 9 && start.y - k >= 0) {
        ret[index] = new PVector(start.x + k, start.y - k);
        k++;
        index++;
      }
      k = 1;
      while (start.x - k >= 0 && start.y + k < 9) {
        ret[index] = new PVector(start.x - k, start.y + k);
        k++;
        index++;
      }
    }
    return ret;
  }

  PVector[] getDg2(int x, int y) {
    PVector[] ret = new PVector[(y >= x ? x - y + 8 : y - x + 8) + 1];
    int k = 0;
    int index = 0;
    PVector start = new PVector(x, y);
    while (start.x + k < 9 && start.y + k < 9) {
      ret[index] = new PVector(start.x + k, start.y + k);
      k++;
      index++;
    }
    k = 1;
    while ( start.x - k >= 0 && start.y - k >= 0) {
      ret[index] = new PVector(start.x - k, start.y - k);
      k++;
      index++;
    }
    return ret;
  }

}*/
