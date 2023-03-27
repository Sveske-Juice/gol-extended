CellGrid grid;
boolean paused = false;
boolean mouseInWin = true;

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

  // Show information about hovering cell
  showCellInfo();
}

void showCellInfo()
{
  if (!mouseInWin)
    return;
  
  // Get current hovering cell
  Cell hoveringCell = grid.getCellAt(mouseX, mouseY);
  if (hoveringCell == null)
    return;
  
  String cellName = hoveringCell.getCellName();
  int cellDepth = hoveringCell.getNeightbourDepth();

  // Create info window
  int elemStep = 25; // padding
  int currentElem = mouseY + 5; // start pos
  int windowXPos = mouseX + 25; // move so cursor is not blocking view

  // background
  int winWidth = width / 5;
  int winHeight = height / 7;
  fill(25, 25, 25);
  rect(windowXPos, mouseY, winWidth, winHeight);

  fill(255);
  textAlign(LEFT, TOP);

  // cell name
  textSize(24);
  text(cellName, windowXPos, currentElem);
  currentElem += elemStep;

  // depth 
  textSize(14);
  text("Neighbour search depth: " + cellDepth, windowXPos, currentElem);
  currentElem += elemStep;  
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

void mouseEntered()
{
  mouseInWin = true;
}

void mouseExited()
{
  mouseInWin = false;
}