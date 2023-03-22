public abstract class Cell
{
    protected boolean m_Alive;
    protected color m_Color;

    /// Decides the depth of how many neighbours this cell depends on. 1 means it's the very near neighbours
    protected int m_NeighbourDepth = 1;

    Cell(boolean alive)
    {
        m_Alive = alive;
    }

    public boolean isAlive() { return m_Alive; }
    public int getNeightbourDepth() { return m_NeighbourDepth; }

    public abstract Cell updateState(int neighbors);

    public void display(int x, int y, int cellPxSize)
    {
        if (m_Alive)
            fill(m_Color);
        else
            fill(255, 255, 255);

        stroke(0);
        rect(x * cellPxSize, y * cellPxSize, cellPxSize, cellPxSize);
    }
}