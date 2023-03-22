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

    m_Grid = new int[m_Cols][m_Rows];

    // Initialize cell grid
    init();
  }

  void init()
  {
    for (int i = 0;i < m_Cols;i++)
    {
      for (int j = 0;j < m_Rows;j++)
      {
        m_Grid[i][j] = int(random(2));
      }
    }
  }

  /// Generates a new generation of cells based on the current
  void generate()
  {
    int[][] nextGrid = new int[m_Cols][m_Rows];

    for (int x = 0; x < m_Cols; x++)
    {
      for (int y = 0; y < m_Rows; y++)
      {
        int neighbors = 0;
        for (int i = -1; i <= 1; i++)
        {
          for (int j = -1; j <= 1; j++)
          {
            neighbors += m_Grid[(x+i+m_Cols)%m_Cols][(y+j+m_Rows)%m_Rows];
          }
        }

        // A little trick to subtract the current cell's state since
        // we added it in the above loop
        neighbors -= m_Grid[x][y];

        // Rules of Life
        if (m_Grid[x][y] == 1)
        {
          // Overpopulation
          if (neighbors > 3)
            nextGrid[x][y] = 0;
          
          // Loneliness
          else if (neighbors < 2)
            nextGrid[x][y] = 0;
          
          // Stasis
          else
            nextGrid[x][y] = m_Grid[x][y];
        }
        else
        {
          // Birth
          if (neighbors == 3)
            nextGrid[x][y] = 1;
          
          // Stasis
          else
            nextGrid[x][y] = m_Grid[x][y];
        }
      }
    }

    m_Grid = nextGrid;
  }

  /// Display the cell grid
  void display()
  {
    for ( int i = 0; i < m_Cols;i++)
    {
      for ( int j = 0; j < m_Rows;j++)
      {
        if ((m_Grid[i][j] == 1)) fill(0);
        else fill(255); 
        stroke(0);
        rect(i * m_CellPxSize, j * m_CellPxSize, m_CellPxSize, m_CellPxSize);
      }
    }
  }
}