class Grade {
  
  int xStart;
  int yStart;
  int xEnd;
  int yEnd;
  
  void Zeichnen() {
    stroke(0);
    strokeWeight(2);
    line(xStart, yStart, xEnd, yEnd);
  }
}
