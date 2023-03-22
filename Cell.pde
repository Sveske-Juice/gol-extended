public abstract class Cell
{
    protected color m_Color = color(255, 0, 200); // Default to pink

    /// Stores the lifetime of the cell. Specifically how many generations the cell have survived.
    protected int m_LifeTime = 0;

    /// Decides the depth of how many neighbours this cell depends on. 1 means it's the very near neighbours
    protected int m_NeighbourDepth = 1;

    public int getNeightbourDepth() { return m_NeighbourDepth; }
    public void increaseLifeTime() { m_LifeTime++; }

    public abstract CellType getCellType();
    public abstract Cell updateState(HashMap<CellType, Integer> neighbours);

    public void display(int x, int y, int cellPxSize)
    {
        fill(m_Color);
        stroke(0);

        rect(x * cellPxSize, y * cellPxSize, cellPxSize, cellPxSize);
    }
}