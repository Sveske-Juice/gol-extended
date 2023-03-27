import java.util.Map;

class CellGrid {

  /// How many pixels each cell should fill on the screen
  private int m_CellPxSize = 50;

  // Stores how many colums and rows there are in the cell grid
  private int m_Cols, m_Rows;

  // Store 2D array representing the cell grid
  private Cell[][] m_Grid;

  CellGrid() {
    m_Cols = width / m_CellPxSize;
    m_Rows = height / m_CellPxSize;

    m_Grid = new Cell[m_Rows][m_Cols];

    // Initialize cell grid
    init();
  }

  void init()
  {
    for (int i = 0; i < m_Rows; i++)
    {
      for (int j = 0; j < m_Cols; j++)
      {
        // 1 out of 50 chance of grass cell at start
        int rand = int(random(0, 50));
        if (rand == 0)
          m_Grid[i][j] = new GrassCell();
        else if (rand == 1)
          m_Grid[i][j] = new WaterCell();
        else
          m_Grid[i][j] = new DirtCell();
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
        Cell currentCell = m_Grid[row][col];
        int depth = currentCell.getNeightbourDepth();
        HashMap<CellType, Integer> neighbours = new HashMap<CellType, Integer>();

        // Generate hashmap that maps cell types to the amount of those spotted as neighbours
        for (int i = -depth; i <= depth; i++)
        {
          for (int j = -depth; j <= depth; j++)
          {
            Cell cell = m_Grid[(row + i + m_Rows) % m_Rows][(col + j + m_Cols) % m_Cols];
            Integer qauntity = neighbours.get(cell.getCellType());

            if (qauntity != null)
              neighbours.put(cell.getCellType(), ++qauntity);
            else
              neighbours.put(cell.getCellType(), 1);
          }
        }

        // Subtract cell's own value from neighbours
        int quantity = neighbours.get(m_Grid[row][col].getCellType());
        neighbours.put(m_Grid[row][col].getCellType(), --quantity);

        m_Grid[row][col].increaseLifeTime();

        // Rules of Life
        Cell newCell = m_Grid[row][col].updateState(neighbours);
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

  void singleStep()
  {
    generate();
  }
}