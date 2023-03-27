CellGrid grid;
boolean paused = false;
boolean mouseInWin = true;
boolean showDebugWin = true;
int simSpeed = 1;
float generationTime = 0f; // Time it takes for generation in this frame

void setup()
{
  size(990, 1000);
  // frameRate(500);
  grid = new CellGrid();
}

void draw()
{
  Time.Tick(millis());
  background(255);

  if (!paused)
  {
    int currentSimGen = 0;
    generationTime = 0f;
    do {
      grid.generate();
      generationTime += grid.getGenTime();
    } while (++currentSimGen < simSpeed);
  }

  grid.display();

  // Show debug window
  if (showDebugWin)
    showDebugWindow();

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
  int windowXPos = mouseX + 25; // move so cursor is not blocking view
  int windowYPos = mouseY;

  int winWidth = width / 5;
  int winHeight = height / 7;

  // If window will be out of window border, reposition the window pos
  if (windowXPos + winWidth > width)
    windowXPos = mouseX - winWidth;
  
  if (windowYPos + winHeight > height)
    windowYPos = mouseY - winHeight;

  int currentElem = windowYPos + 5; // start pos

  // background
  fill(25, 25, 25);
  rect(windowXPos, windowYPos, winWidth, winHeight);

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

void showDebugWindow()
{
  int winWidth = 300;
  int windowXPos = width - winWidth;
  int winHeight = 200;
  int windowYPos = 0;
  
  int elemStep = 25; // padding
  int currentElem = windowYPos + 5; // start pos

  fill(25, 25, 25, 225);
  rect(windowXPos, windowYPos, winWidth, winHeight);

  // data
  float frameTime = Time.dt();
  float drawTime = grid.getDrawTime();

  // settings
  fill(255);
  textAlign(LEFT, TOP);
  textSize(14);

  // frame time
  text("frametime, dt: " + frameTime + "ms" + " ---  FPS: " + frameRate, windowXPos, currentElem);
  currentElem += elemStep;

  // gen time
  text("Generation time: " + generationTime / 1000 + "ms", windowXPos, currentElem);
  currentElem += elemStep;

  // draw time
  text("Draw time: " + drawTime / 1000 + "ms", windowXPos, currentElem);
  currentElem += elemStep;

  // toggle txt
  textAlign(LEFT, BOTTOM);
  text("Toggle this debug window with 'i' key", windowXPos, windowYPos + winHeight);
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
  else if (key == 'i')
    showDebugWin = !showDebugWin;
}

void mouseEntered()
{
  mouseInWin = true;
}

void mouseExited()
{
  mouseInWin = false;
}