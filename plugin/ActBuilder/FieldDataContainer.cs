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
                //лист 1
                (17, 2),
                (17, 7),
                //лист 2
                (42, 1),
                (45, 1),
                (48, 1),
                (51, 1),
                (54, 5),
                (56, 5),
                (59, 1),
                (62, 1),
                (64, 4),
                (68, 1),
                //common
                //основа
                (2, 1),
                (5, 1),
                (8, 1),
                (11, 1),
                //представители
                (21, 1),
                (24, 1),
                (27, 1),
                (30, 1),
                (33, 1),
                (36, 1),
                //исполнитель и экземпляры
                (38, 5),
                (66, 3),
                //подписанты
                (72, 1),
                (75, 1),
                (78, 1),
                (81, 1),
                (84, 1),
                (87, 1),
            };

            (int, int)[] listOfCoordsClouse =
            {
                //объект и комиссия
                (5, 1),
                (6, 10),
                (9, 1),
                (12, 1),
                (15, 1),
                (18, 1),
                (21, 1),
                (24, 1),
                // пункты
                (31, 1),
                (34, 1),
                (38, 1),
                // список
                (41, 1),// TODO: лист реализуй
                //common
                //основа
                (0, 0),
                (0, 0),
                (0, 0),
                (0, 0),
                //представители
                (0, 0),
                (0, 0),
                (0, 0),
                (0, 0),
                (0, 0),
                (0, 0),
                //исполнитель и экземпляры
                (27, 5),
                (43, 3),
                //подписанты
                (50, 1),
                (53, 1),
                (56, 1),
                (59, 1),
                (62, 1),
                (65, 1),
            };

            coordsContainer = new Dictionary<string, (int, int)[]>
            {
                { 
                    "actOSR", listOfCoordsOSR
                },
                {
                    "clouseAct", listOfCoordsClouse
                }
            };
        }
    }
}