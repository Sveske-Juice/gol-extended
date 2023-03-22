public class DryGrassCell extends Cell
{
    DryGrassCell()
    {
        m_Color = color(170, 200, 20); // Yellowish greeen color
    }

    @Override CellType getCellType() { return CellType.DRYGRASS; }

    @Override
    public Cell updateState(HashMap<CellType, Integer> neighbours)
    {
        // Start fire, if there's alot of dry grass near
        Integer dryGrassQuantity = neighbours.get(CellType.DRYGRASS);
        if (dryGrassQuantity != null)
        {
            if (dryGrassQuantity > 7)
            {
                return int(random(0, 500)) == 0 ? new FireCell() : null;
            }
        }

        // Spread fire if theres alot of fire near
        Integer fireQuantity = neighbours.get(CellType.FIRE);
        if (fireQuantity != null)
        {
            if (fireQuantity > 2)
            {
                return int(random(0, 75)) == 0 ? new FireCell() : null;
            }
        }
        return null;
    }
}