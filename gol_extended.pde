CellGrid grid;
boolean paused = false;

void setup()
{
  size(990, 1000);
  // frameRate(10);
  grid = new CellGrid();
}

void draw()
{
  background(255);

  if (!paused)
    grid.generate();

  grid.display();
}

void mouseReleased()
{
  paused = !paused; 
}

void keyPressed()
{
  // Single step on space down and while its paused
  if (key == 32 && paused)
  {
    grid.singleStep();
  }
}