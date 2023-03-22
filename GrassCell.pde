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
            return int(random(0, 100)) == 0 ? new DryGrassCell() : null;

        // Spread fire if there's fire nearby
        Integer fireQuantity = neighbours.get(CellType.FIRE);
        if (fireQuantity != null)
        {
            if (fireQuantity > 3)
            {
                return int(random(0, 300)) == 0 ? new FireCell() : null;
            }
        }

        return null;
    }
}