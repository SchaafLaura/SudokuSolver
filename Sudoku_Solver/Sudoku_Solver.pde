Grid G;
void setup() {
  G = new Grid();
  size(1000, 1000);
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
