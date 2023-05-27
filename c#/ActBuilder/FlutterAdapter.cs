﻿using OfficeOpenXml;
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
        // тест функция проверки компиляции
        [UnmanagedCallersOnly(EntryPoint = "add")]
        public static int Add(int a, int b)
        {
            return a + b;
        }

        // основная функция создания файла. На время тестов отключаем атрибут
        // [UnmanagedCallersOnly(EntryPoint = "createFile")]
        public static int СreateFile(IntPtr pointerInput)
        {
            try
            {
                string stringInput = Marshal.PtrToStringAnsi(pointerInput)!;
                JsonNode clouserNode = JsonNode.Parse(stringInput)!;
                Clouser clouser = clouserNode.Deserialize<Clouser>()!;

                ActMaker.CreateAct(clouser);

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
