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
            string jsonFromApp = @"{""id"":608,""name"":""qwerty"",""path"":""C:\\Users\\danek\\Desktop"",""acts"":[{""id"":1,""name"":""grsfgdfdsfs"",""type"":""actOSR"",""fields"":[{""text"":"""",""hasSpace"":false,""subText"":null},{""text"":""123"",""hasSpace"":false,""subText"":""456""},{""text"":"""",""hasSpace"":false,""subText"":null},{""text"":"""",""hasSpace"":false,""subText"":null},{""text"":""Следующий"",""hasSpace"":false,""subText"":null}]}],""commonInfo"":{""id"":705,""name"":""Акт 32"",""type"":""clouseAct"",""fields"":[{""text"":""Поле 61"",""hasSpace"":true,""subText"":""Подполе 58""},{""text"":""Поле 47"",""hasSpace"":false,""subText"":null},{""text"":""Поле 90"",""hasSpace"":true,""subText"":""Подполе 58""},{""text"":""Поле 12"",""hasSpace"":false,""subText"":null}]}}";
            var a = Marshal.StringToHGlobalUni(jsonFromApp);
            Console.WriteLine(FlutterAdapter.MakeFile(a));

            Console.WriteLine(FlutterAdapter.OpenFile(Marshal.StringToHGlobalUni(@"C:\Users\danek\Desktop\qwerty.xlsx")));
        }
    }
}
