using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ActBuilder
{
    
    static class ActMaker
    {

        public static void CreateAct(Clouser clouser)
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            ExcelPackage packages = new ExcelPackage();
            for (int i = 0; i < clouser.acts.Count; i++)
            {
                makeSheet(packages, clouser.acts[i] ,clouser.commonInfo);
            }

            File.WriteAllBytes(clouser.path + clouser.name + ".xlsx", packages.GetAsByteArray());
            packages.Dispose();
        }
        
        private static void makeSheet(ExcelPackage packages, Act act, List<FieldData> commonInfo)
        {
            ExcelPackage typeTemplate = new ExcelPackage(act.type + ".xlsx");
            ExcelWorksheet sheet = packages.Workbook.Worksheets.Add(act.name, typeTemplate.Workbook.Worksheets.First());
            typeTemplate.Dispose();

            List<FieldData> fullFields = new List<FieldData>();
            fullFields.AddRange(act.fields);
            fullFields.AddRange(commonInfo);

            fillSheet(sheet, fullFields, FieldDataContainer.GetCoordsContainer(act.type));
        }

        private static void fillSheet(ExcelWorksheet sheet, List<FieldData> fields, (int, int)[] coords)
        {
            // шаблон есть, координаты есть, что вставлять есть - можно делать
            Console.WriteLine(1);
        }
    }
}
