class CellGrid {

  /// How many pixels each cell should fill on the screen
  int m_CellPxSize = 8;

  // Stores how many colums and rows there are in the cell grid
  int m_Cols, m_Rows;

  // Store 2D array representing the cell grid
  int[][] m_Grid;

  CellGrid() {
    m_Cols = width / m_CellPxSize;
    m_Rows = height / m_CellPxSize;

    m_Grid = new int[m_Rows][m_Cols];

    // Initialize cell grid
    init();
  }

  void init()
  {
    for (int i = 0;i < m_Rows; i++)
    {
      for (int j = 0;j < m_Cols; j++)
      {
        m_Grid[i][j] = int(random(2));
      }
    }
  }

  /// Generates a new generation of cells based on the current
  void generate()
  {
    int[][] nextGrid = new int[m_Rows][m_Cols];

    for (int row = 0; row < m_Rows; row++)
    {
      for (int col = 0; col < m_Cols; col++)
      {
        int neighbors = 0;
        for (int i = -1; i <= 1; i++)
        {
          for (int j = -1; j <= 1; j++)
          {
            neighbors += m_Grid[(row + i + m_Rows) % m_Rows][(col + j + m_Cols) % m_Cols];
          }
        }

        // A little trick to subtract the current cell's state since
        // we added it in the above loop
        neighbors -= m_Grid[row][col];

        // Rules of Life
        if (m_Grid[row][col] == 1)
        {
          // Overpopulation
          if (neighbors > 3)
            nextGrid[row][col] = 0;
          
          // Loneliness
          else if (neighbors < 2)
            nextGrid[row][col] = 0;
          
          // Stasis
          else
            nextGrid[row][col] = m_Grid[row][col];
        }
        else
        {
          // Birth
          if (neighbors == 3)
            nextGrid[row][col] = 1;
          
          // Stasis
          else
            nextGrid[row][col] = m_Grid[row][col];
        }
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
        if (m_Grid[i][j] == 1) fill(0);
        else fill(255); 
        stroke(0);
        rect(j * m_CellPxSize, i * m_CellPxSize, m_CellPxSize, m_CellPxSize);
      }
    }
  }
}