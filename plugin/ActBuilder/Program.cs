using System.Runtime.InteropServices;

namespace ActBuilder
{
    /// <summary>
    ///  Имеет метод мейн, через который осуществляется отладка написанных функций.
    /// </summary>
    class Program
    {
        static void Main()
        {
                string json = @"{
      ""id"" : 1,
      ""name"": ""qwerty"",
      ""path"": ""C:\\Users\\danek\\Desktop"",
      ""commonInfo"": {
            ""id"" : 0,
            ""name"" : ""Общая информация"",
            ""type"" : ""commonInfo"",
            ""fields"" : [
                {
                    ""text"" : ""хаха"",
                    ""hasSpace"" : true,
                    ""subText"" : ""кек""
                },
                {
                    ""text"" : ""lolkek"",
                    ""hasSpace"" : false
                } 
            ]
    
      },
      ""acts"": [
        {
            ""id"" : 1,
            ""name"" : ""first"",
            ""type"" : ""actOSR"",
            ""fields"" : [
                {
                    ""text"" : ""haррррррррррррррррррр ррррррр ррррррррр рррр рррррррр ррррр рррррр рррррр ррррррррррррррр рррр ррррррр рррр рррррр ррррррррррh"",
                    ""hasSpace"" : true,
                    ""subText"" : ""heh""
                },
                {
                    ""text"" : ""hhhhhhh hhhhhhhhhhhhhh hhhhhhhhhhhhhhhhhhhhhhhh hhhhhhhhhhhhhhhhhhhhh hhhhhhhhhhhhh hh h hhhhhhhhhhh hhhhhhhh hhhhhhhh hhhhhhh hhhh h hh h hhhhhhhhhhh hhhhhhhh hhhhhhhh hhhhhhh hhhh h hh h hhhhhhhhhhh hhhhhhhh hhhhhhhh hhhhhhh hhhh h hh h hhhhhhhhhhh hhhhhhhh hhhhhhhh hhhhhhh hhhh h hh h hhhhhhhhhhh hhhhhhhh hhhhhhhh hhhhhhh hhhh h hh h hhhhhhhhhhh hhhhhhhh hhhhhhhh hhhhhhh hhhh h"",
                    ""hasSpace"" : false
                }
            ]
        },
        {
            ""id"" : 2,
            ""name"" : ""second"",
            ""type"" : ""actOSR"",
            ""fields"" : [
                {
                    ""text"" : ""мда уж"",
                    ""hasSpace"" : false
                },
                {
                    ""text"" : ""hoh1"",
                    ""hasSpace"" : true,
                    ""subText"" : ""heh2""
                }
            ]
        }
      ]
    }
    "
            ;
            string jsonFromApp = @"
{""id"":609,""name"":""Акт тестович"",""path"":""C:\\Users\\danek\\Desktop"",""acts"":[{""id"":1,""name"":""АОСР 1 Геодез. разбивка"",""type"":""actOSR"",""fields"":[{""text"":""Жилой квартал \""Красная площадь\"" расположенный по ул. Конгрессная в г.Краснодар. Литер 14, 15, 18."",""hasSpace"":false,""subText"":null},{""text"":""ООО СЗ \""Ромекс Девелопмент\"", ОГРН 1122312001646, ИНН 2312189274, 350019, г. Краснодар, ул. Дзержинского 100, литер Б, пом. 23, тел./факс: 8(988)461-20-20 "",""hasSpace"":false,""subText"":null},{""text"":""ООО \""Ромекс-Кубань\"", ОГРН 1032305690120, ИНН 2310051721, 350019,г. Краснодар, ул. Дзержинского 100, литер Т, пом. №2, тел./факс: 8(861)258-36-62, e-mail: info@romex.su, св-во выдано Союз \""Саморегулируемая организация \""Межрегиональный альянс строителей\"", ОГРН 1090100000264, ИНН 0107017649"",""hasSpace"":false,""subText"":null},{""text"":""ООО \""АТЭК\"", ОГРН 1032305690120, ИНН 2309120995, 350063, г. Краснодар, ул. Коммунаров 31, кор. 1, тел./факс: 8(61)212-59-88, св-во выдано Саморегулируемая организация \""Гильдия проектных организаций Южного округа\"", ОГРН 1096100000380, ИНН 6164288445       "",""hasSpace"":false,""subText"":null},{""text"":""ТС14,15-1"",""hasSpace"":false,""subText"":null},{""text"":"""",""hasSpace"":false,""subText"":""\""09\"" марта 2023 г.""},{""text"":""Инженер по техническому надзору ООО СЗ \""Ромекс Девелопмент\""  Падалка Алексей Викторович, приказ №24/01/1 от 24.01.2022 г., идентификационный номер специалиста С-23-175601, ОГРН 1122312001646, ИНН 2312189274, 350005, г. Краснодар, ул. Дзержинского 100, литер Б, пом. 23, тел./факс: 8(988)461-20-20 "",""hasSpace"":false,""subText"":null},{""text"":""Начальник участка ООО \""Ромекс-Кубань\""  Локтев Илья Витальевич, приказ №СЗК-1/02 от 09.02.2021 г."",""hasSpace"":false,""subText"":null},{""text"":""Производитель работ ООО \""Ромекс-Кубань\"" Заводяный Алексей Степанович, приказ №СЗК-1/02 от 09.02.2021 г., идентификационный номер специалиста С-23-179163"",""hasSpace"":false,""subText"":null},{""text"":"""",""hasSpace"":false,""subText"":null},{""text"":""Мастер участка ООО \""ТСС\"" Коротовских Сергей Михайловияч №2-п от 20.02.2023 г.,ОГРН 1222300004970, ИНН 2312307697/231201001, Краснодарский край, г. Краснодар, ул. Трамвайная, 13/1, офис 1. "",""hasSpace"":false,""subText"":null},{""text"":""Производитель работ ООО «Ромекс-Кубань» Рогалев Андрей Викторович., приказ № 09/08/22/1 от 09.08.2022 г."",""hasSpace"":false,""subText"":null},{""text"":""ООО \""ТСС\"""",""hasSpace"":false,""subText"":null},{""text"":""Геодезическая разбивка основы сети трубопроводов ТС на участках от УТ1 до УТ2; от УТ1 до Литера 14; от УТ2 до Литера 15"",""hasSpace"":false,""subText"":null},{""text"":""РК-ДП-593-20 -14,15,18 -ТС. ООО \""АТЭК\"", ГИП Тавакалян"",""hasSpace"":false,""subText"":null},{""text"":"""",""hasSpace"":false,""subText"":null},{""text"":""Исполнительная схема №1 лист 1 от 15.05.2023 г."",""hasSpace"":false,""subText"":null},{""text"":""\""09\"" марта 2023 г."",""hasSpace"":false,""subText"":null},{""text"":""\""09\"" марта 2023 г."",""hasSpace"":false,""subText"":null},{""text"":""Рабочая документация РК-ДП-593-20 -14,15,18 -ТС."",""hasSpace"":false,""subText"":"" СП 126.13330.2017 \""Геодезические работы в строительстве\"" . СП 124.13330.2012 \""Наружные тепловые сети\"" . \rСП 74.13330-2011 \""Тепловые сети\"".""},{""text"":""Устройство траншеи сети трубопроводов ТС на участках от УТ1 до УТ2; от УТ1 до Литера 14; от УТ2 до Литера 15"",""hasSpace"":false,""subText"":""2 ""},{""text"":"""",""hasSpace"":false,""subText"":null},{""text"":""Исполнительная схема №1 лист 1 от 15.05.2023 г."",""hasSpace"":false,""subText"":null}]}],""commonInfo"":{""id"":-1,""name"":""Общая информация"",""type"":""commonInfo"",""fields"":[{""text"":""Инженер по техническому надзору ООО СЗ \""Ромекс Девелопмент\"""",""hasSpace"":true,""subText"":""Гиренко Д.Е.""},{""text"":""Начальник участка ООО \""Ромекс-Кубань\"""",""hasSpace"":true,""subText"":""Гиренко Д.Е.""},{""text"":""Производитель работ ООО \""Ромекс-Кубань\"""",""hasSpace"":true,""subText"":""Гиренко Д.Е.""},{""text"":"""",""hasSpace"":true,""subText"":""""},{""text"":""Мастер участка ООО \""ТСС\"""",""hasSpace"":true,""subText"":""Гиренко Д.Е.""},{""text"":""Производитель работ ООО \""Ромекс-Кубань\"""",""hasSpace"":true,""subText"":""Гиренко Д.Е.""}]}}
";
            var a = Marshal.StringToHGlobalUni(jsonFromApp);
            //Console.WriteLine(FlutterAdapter.MakeFile(a));

            //Console.WriteLine(FlutterAdapter.OpenFile(Marshal.StringToHGlobalUni(@"C:\Users\danek\Desktop\qwerty.xlsx")));
        }
    }
}
