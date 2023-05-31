using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
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
        // [UnmanagedCallersOnly(EntryPoint = "makeFile")]
        public static int MakeFile(IntPtr pointerInput)
        {
            try
            {
                string stringInput = Marshal.PtrToStringAnsi(pointerInput)!;
                JsonNode closureNode = JsonNode.Parse(stringInput)!;
                Сlosure closure = closureNode.Deserialize<Сlosure>()!;

                ActMaker.CreateAct(closure);

                // ошибки нет, возвращаем 0
                return 0;
            }
            catch
            {
                // если есть ошибка на стороне С, то возвращаем её код в дарт
                return -1;
            }
        }

        // основная функция создания файла. На время тестов отключаем атрибут
        // [UnmanagedCallersOnly(EntryPoint = "openFile")]
        public static int OpenFile(IntPtr pointerInput)
        {
            try
            {
                string stringInput = Marshal.PtrToStringAnsi(pointerInput)!;
                ActMaker.OpenFileByPath(stringInput);
                // ошибки нет, возвращаем 0
                return 0;
            }
            catch
            {
                // если есть ошибка на стороне С, то возвращаем её код в дарт
                return -1;
            }
        }
    }
}
