public class DirtCell extends Cell
{
    DirtCell()
    {
        m_Color = color(90, 70, 25); // brown color
    }

    @Override CellType getCellType() { return CellType.DIRT; }

    @Override
    public Cell updateState(HashMap<CellType, Integer> neighbours)
    {
        // If at leas one grass block close then become grass
        Integer grassQuantity = neighbours.get(CellType.GRASS);
        if (grassQuantity != null)
        {
            return int(random(0, 50)) == 0 ? new GrassCell() : null;
        }
        return null;
    }

}