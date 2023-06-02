namespace ActBuilder
{
    class Сlosure
    {
        public string name { get; set; }
        public string path { get; set; }
        public ActData commonInfo { get; set; }
        public List<ActData> acts { get; set; }
    }
    class ActData
    {
        public string name { get; set; }
        public string type { get; set; }
        public List<FieldData> fields { get; set; }
    }

    class FieldData
    {
        public string text { get; set; }
        public bool hasSpace { get; set; }
        public string? subText { get; set; }
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
