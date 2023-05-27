using System.Runtime.InteropServices;

namespace ActBuilder
{
    /// <summary>
    ///  Имеет метод мейн, через который осуществляется отладка написанных функций.
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            string json = @"{
  ""name"": ""qwerty"",
  ""path"": ""C:\\Users\\danek\\Desktop"",
  ""commonInfo"": [
    {
        ""text"" : ""lol"",
        ""hasSpace"" : true,
        ""subText"" : ""kek""
    },
    {
        ""text"" : ""ste"",
        ""hasSpace"" : false
    }
  ],
  ""acts"": [
    {
        ""name"" : ""first"",
        ""type"" : ""actOSR"",
        ""fields"" : [
            {
                ""text"" : ""hah"",
                ""hasSpace"" : true,
                ""subText"" : ""heh""
            },
            {
                ""text"" : ""hoh"",
                ""hasSpace"" : false
            }
        ]
    },
    {
        ""name"" : ""second"",
        ""type"" : ""actOSR"",
        ""fields"" : [
            {
                ""text"" : ""hah1"",
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
";
            var a = Marshal.StringToHGlobalAnsi(json);
            Console.WriteLine(FlutterAdapter.СreateFile(a));
        }
    }
}
