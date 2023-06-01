using System.Runtime.InteropServices;
using System.Text;
using System.Text.Json;
using System.Text.Json.Nodes;

namespace ActBuilder
{
    /// <summary>
    /// Хранит все методы, которые могут вызываться через FFI, парсит данные в модели, играет роль фасада
    /// </summary> 
    class FlutterAdapter
    {
        // основная функция создания файла. На время тестов отключаем атрибут
        [UnmanagedCallersOnly(EntryPoint = "makeFile")]
        public static IntPtr MakeFile(IntPtr pointerInput)
        {
            try
            {
                string stringInput = Marshal.PtrToStringUni(pointerInput)!;
                JsonNode closureNode = JsonNode.Parse(stringInput)!;
                Сlosure closure = closureNode.Deserialize<Сlosure>()!;

                ActMaker.CreateAct(closure);

                // ошибки нет, возвращаем 0
                return Marshal.StringToHGlobalUni("0");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                // если есть ошибка на стороне С, то возвращаем её код в дарт
                return Marshal.StringToHGlobalUni(e.Message);
            }
        }

        // основная функция создания файла. На время тестов отключаем атрибут
        [UnmanagedCallersOnly(EntryPoint = "openFile")]
        public static IntPtr OpenFile(IntPtr pointerInput)
        {
            try
            {
                string stringInput = Marshal.PtrToStringUni(pointerInput)!;
                ActMaker.OpenFileByPath(stringInput);
                
                // ошибки нет, возвращаем 0
                return Marshal.StringToHGlobalUni("0");
            }
            catch (Exception e)
            {
                // если есть ошибка на стороне С, то возвращаем её код в дарт
                return Marshal.StringToHGlobalUni(e.Message);
            }
        }
    }
}
