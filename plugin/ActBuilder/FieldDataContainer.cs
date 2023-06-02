namespace ActBuilder
{
    /// <summary>
    /// Хранит в себе coordsContainer, в котором по названию типа акта можно получить массив координат его полей
    /// </summary>
    static class FieldDataContainer
    {
        static Dictionary<string, (int, int)[]>? coordsContainer;

        public static (int, int)[] GetCoordsContainer(string type)
        {
            if (coordsContainer == null)
            {
                Init();
            }

            return coordsContainer![type]!;
        }

        static private void Init()
        {
            (int, int)[] listOfCoordsOSR =
            {
                (2, 1),
                (5, 1),
                (8, 1),
                (11, 1),
                (17, 2),
                (17, 7),
                (21, 1),
                (24, 1),
                (27, 1),
                (30, 1),
                (33, 1),
                (36, 1),
                //list2
                (38, 5),
                (42, 1),
                (45, 1),
                (48, 1),
                (51, 1),
                (54, 5),
                (56, 5),
                (59, 1),
                (62, 1),
                (64, 4),
                (66, 3),
                (68, 1),
                //common
                (72, 1),
                (75, 1),
                (78, 1),
                (81, 1),
                (84, 1),
                (87, 1),
            };

            coordsContainer = new Dictionary<string, (int, int)[]>
            {
                { "actOSR", listOfCoordsOSR }
            };
        }
    }
}