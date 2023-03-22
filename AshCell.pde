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
        return null;
    }
}