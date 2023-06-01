﻿using OfficeOpenXml;
using OfficeOpenXml.Style;
using System.Diagnostics;
using System.Drawing;

namespace ActBuilder
{
    
    static class ActMaker
    {
        const double maxFieldsWidth = 107;
        static Bitmap? bitmap;
        static Graphics? graphics;

        public static void OpenFileByPath(string path)
        {
            if (File.Exists(path))
            {
                Process p = new()
                {
                    StartInfo = new ProcessStartInfo(path)
                    {
                        UseShellExecute = true
                    }
                };
                p.Start();
            }
            else
                Console.WriteLine("Файл не найден");

        }

        // создаём файл и начинаем обрабатывать листы
        public static void CreateAct(Сlosure clouser)
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            ExcelPackage packages = new();
            bitmap = new Bitmap(1, 1);
            graphics = Graphics.FromImage(bitmap);

            for (int i = 0; i < clouser.acts.Count; i++)
            {
                MakeSheet(packages, clouser.acts[i], clouser.commonInfo.fields);
            }

            File.WriteAllBytes(clouser.path +"\\"+ clouser.name + ".xlsx", packages.GetAsByteArray());
            packages.Dispose();
            bitmap?.Dispose();
            graphics?.Dispose();
        }
        
        // создаём листы
        static void MakeSheet(ExcelPackage packages, ActData act, List<FieldData> commonInfo)
        {
            ExcelPackage typeTemplate = new("C:\\Users\\danek\\Documents\\GitHub\\builders_act_maker\\c#\\ActBuilder\\bin\\Debug\\net6.0\\win-x64\\publish\\" + act.type + ".xlsx");
            if (typeTemplate.Workbook.Worksheets.Count == 0)
            {
                throw new Exception("Потеряны шаблоны");
            }
            ExcelWorksheet sheet = packages.Workbook.Worksheets.Add(act.name, typeTemplate.Workbook.Worksheets.First());
            typeTemplate.Dispose();

            List<FieldData> fullFields = new();
            fullFields.AddRange(act.fields);
            fullFields.AddRange(commonInfo);

            FillSheet(sheet, fullFields, FieldDataContainer.GetCoordsContainer(act.type));
        }

        // заполняем по координатам и по полям данный нам лист
        static void FillSheet(ExcelWorksheet sheet, List<FieldData> fields, (int, int)[] coords)
        {
            int shift = 0;
            for (int i = 0; i < fields.Count; i++)
            {
                FieldData field = fields[i];
                (int x, int y) = coords[i];
                x += shift;
                double widthOfSubPart = 0;

                // если нужен отступ, то размещаем дополнительный текст его в первой строке,
                // а дальше действуем как обычно с учётом уменьшенной длины первой строки
                if (field.hasSpace)
                {
                    // считаем сколько клеток смержено
                    int mergeCount = 0;
                    while (sheet.Cells[x, y + 1 + mergeCount].Merge)
                    {
                        mergeCount++;
                    }

                    sheet.Cells[x, y, x, y + mergeCount].Merge = false;
                    sheet.Cells[x, y, x, y + mergeCount - 1].Merge = true;

                    sheet.Cells[x, y + mergeCount].Value = field.subText ?? "";
                    sheet.Cells[x, y + mergeCount].Style.HorizontalAlignment = ExcelHorizontalAlignment.Right;
                    widthOfSubPart = Math.Max(CalculateTextWidth(field.subText ?? "", sheet.Cells[x, y + mergeCount].Style.Font), sheet.Columns[y + mergeCount].Width);
                } else if (field.subText != null)
                {
                    field.text = field.subText + field.text;
                }

                double widthOfText = CalculateTextWidth(field.text, sheet.Cells[x, y].Style.Font);
                
                if (widthOfText + widthOfSubPart <= maxFieldsWidth)
                {
                    sheet.Cells[x, y].Value = field.text;
                } else
                {
                    // если текст длиннее, чем одна строка, то дробим его на слова по пробелам и увеличиваем количество строк,
                    // до тех пор, пока не впихнём все слова

                    // считаем сколько клеток смержено
                    int mergeCount = 0;
                    while (sheet.Cells[x, y+1 + mergeCount].Merge)
                    {
                        mergeCount++;
                    }

                    List<string> partOfText = field.text.Split(" ").ToList();
                    string nowText = partOfText[0];
                    int j = 1;
                    while (j < partOfText.Count)
                    {
                        double widthOfNextText = CalculateTextWidth(nowText + " " + partOfText[j], sheet.Cells[x, y].Style.Font) + widthOfSubPart;
                        // если текст+следующее слово уже не помещаются в строку
                        if (widthOfNextText > maxFieldsWidth)
                        {
                            // дополнительная часть влияет только на первую строку
                            widthOfSubPart = 0;

                            sheet.InsertRow(x, y);
                            sheet.Cells[x, y, x, y + mergeCount].Merge = true;
                            sheet.Cells[x, y].Value = nowText;
                            sheet.Cells[x, y].Style.Font.Italic = sheet.Cells[x+1, y].Style.Font.Italic;
                            for (int k = 0; k <= mergeCount; k++)
                            {
                                sheet.Cells[x, y+k].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                            }

                            nowText = partOfText[j];
                            shift++;
                            x++;
                        } else
                        {
                            nowText += " " + partOfText[j];
                        }
                        j++;
                    }
                    sheet.Cells[x, y].Value = nowText;
                }
            }
        }

        static double CalculateTextWidth(string text, ExcelFont font)
        {
            const double excelWidthMult = 8.625;
            if (string.IsNullOrEmpty(text)) return 0.0;

            var drawingFont = new Font(font.Name, font.Size * 1.01f);
            var size = graphics.MeasureString(text, drawingFont);

            return Convert.ToDouble(size.Width) / excelWidthMult;
        }
    }
}