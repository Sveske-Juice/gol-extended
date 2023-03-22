class CellGrid {

  /// How many pixels each cell should fill on the screen
  int m_CellPxSize = 8;

  // Stores how many colums and rows there are in the cell grid
  int m_Cols, m_Rows;

  // Store 2D array representing the cell grid
  Cell[][] m_Grid;

  CellGrid() {
    m_Cols = width / m_CellPxSize;
    m_Rows = height / m_CellPxSize;

    m_Grid = new Cell[m_Rows][m_Cols];

    // Initialize cell grid
    init();
  }

  void init()
  {
    for (int i = 0;i < m_Rows; i++)
    {
      for (int j = 0;j < m_Cols; j++)
      {
        m_Grid[i][j] = new DirtCell(true);
      }
    }
  }

  /// Generates a new generation of cells based on the current
  void generate()
  {
    Cell[][] nextGrid = new Cell[m_Rows][m_Cols];

    for (int row = 0; row < m_Rows; row++)
    {
      for (int col = 0; col < m_Cols; col++)
      {
        int neighbors = 0;
        for (int i = -1; i <= 1; i++)
        {
          for (int j = -1; j <= 1; j++)
          {
            if (m_Grid[(row + i + m_Rows) % m_Rows][(col + j + m_Cols) % m_Cols].isAlive())
              neighbors++;
          }
        }

        // Subtract cell's own value from neigbours
        if (m_Grid[row][col].isAlive()) neighbors--;

        // Rules of Life
        Cell newCell = m_Grid[row][col].updateState(neighbors);
        if (newCell == null) // Same cell survived: Stasis
          nextGrid[row][col] = m_Grid[row][col];
        else
          nextGrid[row][col] = newCell;
      }
    }

    m_Grid = nextGrid;
  }

  /// Display the cell grid
  void display()
  {
    for (int i = 0; i < m_Rows; i++)
    {
      for (int j = 0; j < m_Cols; j++)
      {
        // x-cord is column (j) and y-cord is row (i)
        m_Grid[i][j].display(j, i, m_CellPxSize);
      }
    }
  }
}