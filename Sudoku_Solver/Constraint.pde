abstract class Constraint {
  IntVector[] cellIndices;

  public Constraint(IntVector[] cellIndices) {
    this.cellIndices = cellIndices;
  }
}

class UniquenessConstraint extends Constraint {
  public UniquenessConstraint(IntVector[]cellIndices) {
    super(cellIndices);
  }
}


class SumConstraint extends Constraint {
  int sum;
  public SumConstraint(IntVector[] cellIndices, int sum) {
    super(cellIndices);
    this.sum = sum;
  }
}



/*abstract class Constraint {
  PVector[] cellIndices;
  color c;

  public Constraint(PVector[] cellIndices) {
    this.cellIndices = cellIndices;
  }

  abstract boolean isSatisfied();
  abstract boolean isPossible();

  public void display() {
    if (cellIndices.length == 0 || cellIndices.length == 1) {
      return;
    }

    PVector pos = cellIndices[0];
    PVector drawPos = G.indicesToPos((int)pos.x, (int)pos.y);
    for (int i = 0; i < cellIndices.length - 1; i++) {
      PVector nextPos = cellIndices[i + 1];
      PVector nextDrawPos = G.indicesToPos((int)nextPos.x, (int)nextPos.y);
      float sW = map (i, 0, cellIndices.length, 5, 0.5);
      strokeWeight(sW);
      stroke(c);
      line(drawPos.x, drawPos.y, nextDrawPos.x, nextDrawPos.y);
      pos = nextPos.copy();
      drawPos = G.indicesToPos((int)pos.x, (int)pos.y);
    }
  }
}

class SumConstraint extends Constraint {
  int sum;
  public SumConstraint(PVector[] cellIndices, int sum) {
    super(cellIndices);
    this.sum = sum;
    this.c = color(80, 220, 195, 125);
  }
  public boolean isSatisfied() {
    int val = 0;
    for (int i = 0; i < cellIndices.length; i++) {
      val += G.getCellValue((int) cellIndices[i].x, (int) cellIndices[i].y);
    }
    return (val == sum);
  }

  // TODO: actually implement this by looking at the possibilities
  public boolean isPossible() {
    return true;
  }
}

class UniquenessConstraint extends Constraint {
  public UniquenessConstraint(PVector[] cellIndices) {
    super(cellIndices);
    this.c = color(200, 80, 195, 125);
  }
  public boolean isSatisfied() {
    for (int i = 0; i < cellIndices.length; i++) {
      int currVal = G.getCellValue((int) cellIndices[i].x, (int) cellIndices[i].y);
      if (currVal != 0) {
        for (int j = 0; j < cellIndices.length; j++) {
          if (i != j) {
            int checkVal = G.getCellValue((int) cellIndices[j].x, (int) cellIndices[j].y);
            if (checkVal != 0) {
              if (currVal == checkVal) {
                return false;
              }
            }
          }
        }
      }
    }
    return true;
  }

  // TODO: actually implement this by looking at possibilities
  public boolean isPossible() {
    return true;
  }
}*/
