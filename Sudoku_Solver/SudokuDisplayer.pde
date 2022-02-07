class SudokuDisplayer {
  Sudoku sudoku;
  PGraphics image;

  void display() {
    image.beginDraw();
    displayGrid();
    displayNumbers();


    image.endDraw();
    image(image, 0, 0);
  }

  private void displayNumbers() {
    // drawing parameters
    image.fill(0);
    image.textSize(50);
    image.textAlign(CENTER, CENTER);

    // width and height of Grid
    int w = this.sudoku.grid.w;
    int h = this.sudoku.grid.h;

    Cell[][] cells = this.sudoku.grid.cells;
    for (int x = 0; x < w; x++) {
      for (int y = 0; y < h; y++) {
        IntVector boardPosition = new IntVector(x, y);
        PVector imagePosition = boardPositionToImagePosition(boardPosition);

        image.text(cells[boardPosition.x][boardPosition.y].digit, imagePosition.x, imagePosition.y);
      }
    }
  }

  private void displayGrid() {
    // drawing parameters
    image.strokeWeight(3);
    image.stroke(0);

    // width and height of Grid
    int w = this.sudoku.grid.w;
    int h = this.sudoku.grid.h;

    // width and height of image
    int W = this.image.width;
    int H = this.image.height;

    // drawing horizontal and vertical lines
    for (int x = 0; x <= w; x++) {
      image.line(x * (W/w), 0, x * (W/w), H);
    }
    for (int y = 0; y <= h; y++) {
      image.line(0, y * (H/h), W, y * (H/h));
    }
  }

  PVector boardPositionToImagePosition(IntVector boardPosition) {
    // width and height of Grid
    int w = this.sudoku.grid.w;
    int h = this.sudoku.grid.h;

    // width and height of image
    int W = this.image.width;
    int H = this.image.height;

    float x = map(boardPosition.x + 0.5f, 0, w, 0, W);
    float y = map(boardPosition.y + 0.5f, 0, h, 0, H);

    return new PVector(x, y);
  }
}
