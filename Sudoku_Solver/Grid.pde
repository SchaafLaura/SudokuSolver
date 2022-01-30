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

  public int getCellValue(int x, int y) {
    return cells[x][y].digit;
  }

  void addConstraint(Constraint c) {
    Constraint[] newConstraints = new Constraint[constraints.length + 1];
    for (int i = 0; i < constraints.length; i++) {
      newConstraints[i] = constraints[i];
    }
    newConstraints[constraints.length] = c;
    constraints = newConstraints.clone();
  }

  PVector[] getCol(int x) {
    PVector[] ret = new PVector[9];
    for (int i = 0; i < 9; i++) {
      ret[i] = new PVector(x, i);
    }
    return ret;
  }

  PVector[] getRow(int x) {
    PVector[] ret = new PVector[9];
    for (int i = 0; i < 9; i++) {
      ret[i] = new PVector(i, x);
    }
    return ret;
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

  void clearHightlights() {
    //highlights = new PVector[0];
    highlights = new Highlight[0];
  }

  void clearConstraints() {
    constraints = new Constraint[0];
  }

  PVector indicesToPos(int i, int j) {
    float x = map(i + 0.5f, 0, 9, 0, width);
    float y = map(j + 0.5f, 0, 9, 0, height);
    return new PVector(x, y);
  }

  PVector posToIndices(int x, int y) {
    int i = (int) map(x, 0, width, 0, 9);
    int j = (int) map(y, 0, height, 0, 9);
    return new PVector(i, j);
  }


  void addHightlights(Highlight toAdd) {
    Highlight[] newHighlights = new Highlight[highlights.length + 1];
    int k = 0;
    for (int i = 0; i < highlights.length; i++) {
      newHighlights[k] = highlights[k].copy();
      k++;
    }
    newHighlights[k] = toAdd;

    highlights = newHighlights.clone();
  }

  void initCells() {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        cells[i][j] = new Cell(i, j);
      }
    }
  }

  void placeNumAtXY(int num, int x, int y) {
    cells[x][y].setDigit(num); // returns boolean if succesfull (in case I need it later)
  }

  void display() {
    displayLines();
    displayHighlights();
    displayNumbers();
    //displayConstraints();
    displayPossibilities();
  }

  void displayConstraints() {
    for (int i = 0; i < constraints.length; i++) {
      constraints[i].display();
    }
  }

  void displayHighlights() {
    for (int i = 0; i < highlights.length; i++) {
      fill(color(0, 255, 0));
      noStroke();
      highlights[i].display();
    }
  }

  void displayNumbers() {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (cells[i][j].hasDigit) {
          fill(0);
          textSize(40);
          textAlign(CENTER, CENTER);
          text(cells[i][j].digit, ((float)i + 0.5) * width/9, ((float)j + 0.5) * height/9);
        }
      }
    }
  }

  void displayLines() {
    for (int i = 0; i <= 9; i++) {
      stroke(0);
      if (i % 3 == 0) {
        strokeWeight(3);
      } else {
        strokeWeight(1);
      }
      line(i * width/9, 0, i*width/9, height);
    }
    for (int i = 0; i <= 9; i++) {
      stroke(0);
      if (i % 3 == 0) {
        strokeWeight(5);
      } else {
        strokeWeight(1);
      }
      line(0, i * height/9, width, i * height/9);
    }
  }

  void displayPossibilities() {
    int[] possibilities;
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        possibilities = getPossibilitiesAtXY(i, j);
        PVector drawPos = indicesToPos(i, j);
        String str = intArrayToString(possibilities);
        fill(0);
        textSize(10);
        text(str, drawPos.x - 25, drawPos.y + 10);
      }
    }
  }

  int[] getPossibilitiesAtXY(int x, int y) {
    return cells[x][y].getPossibleDigits();
  }

  PVector[] getBox(int n) {
    PVector[] ret = new PVector[9];
    int index = 0;
    if (n == 1) {
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          ret[index] = new PVector(i, j);
          index++;
        }
      }
    } else if (n == 2) {
      for (int i = 3; i < 6; i++) {
        for (int j = 0; j < 3; j++) {
          ret[index] = new PVector(i, j);
          index++;
        }
      }
    } else if (n == 3) {
      for (int i = 6; i < 9; i++) {
        for (int j = 0; j < 3; j++) {
          ret[index] = new PVector(i, j);
          index++;
        }
      }
    } else if (n == 4) {
      for (int i = 0; i < 3; i++) {
        for (int j = 3; j < 6; j++) {
          ret[index] = new PVector(i, j);
          index++;
        }
      }
    } else if (n == 5) {
      for (int i = 3; i < 6; i++) {
        for (int j = 3; j < 6; j++) {
          ret[index] = new PVector(i, j);
          index++;
        }
      }
    } else if (n == 6) {
      for (int i = 6; i < 9; i++) {
        for (int j = 3; j < 6; j++) {
          ret[index] = new PVector(i, j);
          index++;
        }
      }
    } else if (n == 7) {
      for (int i = 0; i < 3; i++) {
        for (int j = 6; j < 9; j++) {
          ret[index] = new PVector(i, j);
          index++;
        }
      }
    } else if (n == 8) {
      for (int i = 3; i < 6; i++) {
        for (int j = 6; j < 9; j++) {
          ret[index] = new PVector(i, j);
          index++;
        }
      }
    } else if (n == 9) {
      for (int i = 6; i < 9; i++) {
        for (int j = 6; j < 9; j++) {
          ret[index] = new PVector(i, j);
          index++;
        }
      }
    }
    return ret;
  }
}*/
