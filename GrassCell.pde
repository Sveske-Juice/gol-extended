public class GrassCell extends Cell
{
    GrassCell()
    {
        m_Color = color(15, 175, 15); // Green color
    }

    @Override CellType getCellType() { return CellType.GRASS; }

    @Override
    public Cell updateState(HashMap<CellType, Integer> neighbours)
    {
        if (m_LifeTime > 100)
            return new DryGrassCell();
        return null;
    }
}