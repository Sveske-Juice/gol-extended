public class AshCell extends Cell
{
    AshCell()
    {
        m_Color = color(100, 100, 100); // Grey
    }

    @Override CellType getCellType() { return CellType.ASH; }

    @Override
    public Cell updateState(HashMap<CellType, Integer> neighbours)
    {
        if (m_LifeTime > 1000)
        {
            return int(random(0, 1000)) == 0 ? new DirtCell() : null;
        }

        return null;
    }
}