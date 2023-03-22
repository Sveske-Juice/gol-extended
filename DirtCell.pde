public class DirtCell extends Cell
{
    DirtCell(boolean alive)
    {
        super(alive);
        m_Color = color(90, 70, 25); // brown color
    }

    @Override
    public Cell updateState(int neighbors)
    {
        return null;
    }
}