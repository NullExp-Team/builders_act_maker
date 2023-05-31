using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
}
