class Highlight {
  PVector[] highlights;
  color c;
  public Highlight(PVector[] highlights, color c) {
    this.highlights = new PVector[highlights.length];
    this.highlights = highlights;
    this.c = c;
  }
  public Highlight(PVector highlight, color c) {
    this.c = c;
    this.highlights = new PVector[1];
    this.highlights[0] = highlight;
  }
  Highlight copy() {
    return new Highlight(this.highlights.clone(), this.c);
  }
  void display() {
    fill(this.c);
    for (int i = 0; i < highlights.length; i++) {
      circle(((float)highlights[i].x + 0.5) * width/9, ((float)highlights[i].y + 0.5) * height/9, 50);
    }
  }
}
