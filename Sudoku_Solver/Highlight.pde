class Highlight {
  PVector[] highlights;
  color col;
  public Highlight(PVector[] highlights, color col) {
    this.highlights = new PVector[highlights.length];
    this.highlights = highlights;
    this.col = col;
  }
  public Highlight(PVector highlight, color col) {
    this.col = col;
    this.highlights = new PVector[1];
    this.highlights[0] = highlight;
  }
  Highlight copy() {
    return new Highlight(this.highlights.clone(), this.col);
  }
  void display() {
    fill(this.col);
    for (int i = 0; i < highlights.length; i++) {
      circle(((float)highlights[i].x + 0.5) * width/9, ((float)highlights[i].y + 0.5) * height/9, 50);
    }
  }
}
