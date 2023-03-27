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
        // Spread fire if there's enough fire nearby
        Integer fireQuantity = neighbours.get(CellType.FIRE);
        if (fireQuantity != null)
        {
            if (fireQuantity > 1)
            {
                return int(random(0, 100)) == 0 ? new FireCell() : null;
            }
        }

        if (m_LifeTime > 500)
        {
            Integer waterQuantity = neighbours.get(CellType.WATER);
            if (waterQuantity == null) // Slowly turn to dry grass if no water source nearby
                return int(random(0, 100)) == 0 ? new DryGrassCell() : null;
        }

        return null;
    }
}