using OfficeOpenXml;
using System;
using System.Runtime.InteropServices;

namespace ActBuilder
{
    /// <summary>
    /// Хранит все методы, которые могут вызываться через FFI
    /// Одновременно роль фасада - то есть определяет методы, которые объединяют нужные методы рабочих классов
    /// </summary> 
    class FlutterAdapter
    {
        [UnmanagedCallersOnly(EntryPoint = "add")]
        public static int Add(int a, int b)
        {
            return a + b;
        }
        [UnmanagedCallersOnly(EntryPoint = "ops")]
        public static int Ops(int a, int b)
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            var packages = new ExcelPackage();
            var sheet = packages.Workbook.Worksheets.Add("Market Report");
            var byt = packages.GetAsByteArray();

            File.WriteAllBytes("Report.xlsx", byt);
            return 8;
        }
    }
}
