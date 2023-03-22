CellGrid grid;

void setup() {
  size(1000, 1000);
  grid = new CellGrid();
}

void draw() {
  background(255);

  grid.generate();
  grid.display();
}

// reset m_Grid when mouse is pressed
void mousePressed() {
  grid.init();
}