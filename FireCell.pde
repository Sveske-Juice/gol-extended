public class FireCell extends Cell
{
    FireCell()
    {
        m_Color = color(200, 115, 10); // Orange
    }

    @Override CellType getCellType() { return CellType.FIRE; }

    @Override
    public Cell updateState(HashMap<CellType, Integer> neighbours)
    {

        return null;
    }
}