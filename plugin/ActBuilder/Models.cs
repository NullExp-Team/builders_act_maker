namespace ActBuilder
{
    class Сlosure
    {
        public string Name { get; set; }
        public string Path { get; set; }
        public ActData CommonInfo { get; set; }
        public List<ActData> Acts { get; set; }
    }
    class ActData
    {
        public string Name { get; set; }
        public string Type { get; set; }
        public List<FieldData> Fields { get; set; }
    }

    class FieldData
    {
        public string Text { get; set; }
        public bool HasSpace { get; set; }
        public string? SubText { get; set; }
    }

    class ExcelFieldData : IComparable<ExcelFieldData>
    {
        public FieldData Text { get; set; }

        public (int, int) Coords { get; set; }

        public ExcelFieldData(FieldData text, (int, int) coords)
        {
            Text = text;
            Coords = coords;
        }

        public int CompareTo(ExcelFieldData? other)
        {
            if (other == null) return 1;
            if (other.Coords.Item1 == this.Coords.Item1)
            {
                if (other.Coords.Item2 == this.Coords.Item2)
                {
                    return 0;
                } else if (other.Coords.Item2 < this.Coords.Item2)
                {
                    return 1;
                } else
                {
                    return -1;
                }
            } else if (other.Coords.Item1 < this.Coords.Item1)
            {
                return 1;
            } else
            {
                return -1;
            }

        }
    }
}
