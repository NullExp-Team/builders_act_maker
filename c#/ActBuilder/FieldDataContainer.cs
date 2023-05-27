using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ActBuilder
{
    static class FieldDataContainer
    {
        static bool isInit = false;
        static Dictionary<String, (int, int)[]> coordsContainer = new Dictionary<string, (int, int)[]>();
        public static (int, int)[] GetCoordsContainer(string type)
        {
            if (!isInit)
            {
                isInit = true;
                Init();
            }

            return coordsContainer[type]!;
        }

        static private void Init()
        {
            (int, int)[] listOfCoordsOSR =
            {
                (2, 1),
                (5, 1),
                (8, 1),
                (11, 1),
            };

            coordsContainer.Add("actOSR", listOfCoordsOSR);
        }
    }
}