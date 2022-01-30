void setup() {
  size(1000, 1000);
}

void draw() {
  background(0);
}

PVector indicesToScreenPosition(IntVector indices) {
  PVector ret = new PVector();






  return ret;
}




/* 

TODOs for Refactoring:
  - cells do not have default neighbors. Instead they are created dynamically by considering what constraints they are part of.
  - creation of a "Sudoku" class, which has
    - fields  : Grid, Constraint(s), 
    - methods : displayGrid, placeDigit, 
  - 


*/
/*
Grid G;
void setup() {
  G = new Grid();
  addConstraints();
  G.cells[3][5].setDigit(8);
  G.updatePossibilities();
  size(1000, 1000);
}

String intArrayToString(int[] input) {
  String ret = "";
  for (int i = 0; i < input.length; i++) {
    if (input[i] != 0) {
      ret += input[i];
    }
  }
  return ret;
}


void draw() {
  //frameRate(1);
  background(255);
  G.display();
  G.clearHightlights();
  PVector mouseCell = G.posToIndices(mouseX, mouseY);
  int x = (int)mouseCell.x;
  int y = (int)mouseCell.y;
  G.addHightlights(new Highlight(G.cells[x][y].getColNeighbors(), color(0, 255, 0)));
  G.addHightlights(new Highlight(G.cells[x][y].getRowNeighbors(), color(0, 255, 0)));
  G.addHightlights(new Highlight(G.cells[x][y].getBoxNeighbors(), color(0, 255, 0)));
  G.addHightlights(new Highlight(G.cells[x][y].pos, color(255, 255, 0)));

  G.clearConstraints();
}

public void addConstraints() {
  // regular Sudoku constraints
  for (int i = 0; i < 9; i++) {
    G.addConstraint(new UniquenessConstraint(G.getCol(i)));
    G.addConstraint(new UniquenessConstraint(G.getRow(i)));
    G.addConstraint(new UniquenessConstraint(G.getBox(i+1)));
  }

  // diagonal uniqueness and sum constraints
  G.addConstraint(new UniquenessConstraint(G.getDg2(0, 2)));
  G.addConstraint(new SumConstraint(G.getDg2(0, 2), 36));

  G.addConstraint(new UniquenessConstraint(G.getDg2(2, 0)));
  G.addConstraint(new SumConstraint(G.getDg2(2, 0), 36));

  G.addConstraint(new UniquenessConstraint(G.getDg1(0, 6)));
  G.addConstraint(new SumConstraint(G.getDg1(0, 6), 36));

  G.addConstraint(new UniquenessConstraint(G.getDg1(2, 8)));
  G.addConstraint(new SumConstraint(G.getDg1(2, 8), 36));
}
*/
