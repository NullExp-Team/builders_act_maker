using OfficeOpenXml;
using OfficeOpenXml.Style;
using System.Diagnostics;
using System.Drawing;
using System.Linq;

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

            for (int i = 0; i < clouser.Acts.Count; i++)
            {
                MakeSheet(packages, clouser.Acts[i], clouser.CommonInfo.Fields);
            }

            File.WriteAllBytes(clouser.Path + "\\" + clouser.Name + ".xlsx", packages.GetAsByteArray());
            packages.Dispose();
            bitmap?.Dispose();
            graphics?.Dispose();
        }

        // создаём листы
        static void MakeSheet(ExcelPackage packages, ActData act, List<FieldData> commonInfo)
        {
            ExcelPackage typeTemplate = new("plugin\\act_builder_lib\\" + act.Type + ".xlsx");
            if (typeTemplate.Workbook.Worksheets.Count == 0)
            {
                throw new Exception("Потеряны шаблоны");
            }
            ExcelWorksheet sheet = packages.Workbook.Worksheets.Add(act.Name, typeTemplate.Workbook.Worksheets.First());
            typeTemplate.Dispose();

            (int, int)[] fieldsCoords = FieldDataContainer.GetCoordsContainer(act.Type);
            List<ExcelFieldData> fields = new();
            for (int i = 0; i < act.Fields.Count; i++)
            {
                ExcelFieldData field = new (act.Fields[i], fieldsCoords[i]);
                fields.Add(field);
            }
            for (int i = 0; i < commonInfo.Count; i++)
            {
                ExcelFieldData field = new(commonInfo[i], fieldsCoords[act.Fields.Count + i]);
                fields.Add(field);
            }

            fields.Sort();

            FillSheet(sheet, fields);
        }

        // заполняем по координатам и по полям данный нам лист
        static void FillSheet(ExcelWorksheet sheet, List<ExcelFieldData> fields)
        {
            int shift = 0;
            for (int i = 0; i < fields.Count; i++)
            {
                FieldData field = fields[i].Text;
                (int x, int y) = fields[i].Coords;
                if (x == 0 || y == 0)
                {
                    continue;
                }
                x += shift;
                double widthOfSubPart = 0;

                // если нужен отступ, то размещаем дополнительный текст его в первой строке,
                // а дальше действуем как обычно с учётом уменьшенной длины первой строки
                if (field.HasSpace)
                {
                    // считаем сколько клеток смержено
                    int mergeCount = 0;
                    while (sheet.Cells[x, y + 1 + mergeCount].Merge)
                    {
                        mergeCount++;
                    }

                    sheet.Cells[x, y, x, y + mergeCount].Merge = false;
                    sheet.Cells[x, y, x, y + mergeCount - 1].Merge = true;

                    sheet.Cells[x, y + mergeCount].Value = field.SubText ?? "";
                    sheet.Cells[x, y + mergeCount].Style.HorizontalAlignment = ExcelHorizontalAlignment.Right;
                    widthOfSubPart = Math.Max(CalculateTextWidth(field.SubText ?? "", sheet.Cells[x, y + mergeCount].Style.Font), sheet.Columns[y + mergeCount].Width);
                }
                else if (field.SubText != null)
                {
                    field.Text = field.Text + field.SubText;
                }

                double widthOfText = CalculateTextWidth(field.Text, sheet.Cells[x, y].Style.Font);
                bool isMultiLine = field.Text.Contains('\n');

                if (widthOfText + widthOfSubPart <= maxFieldsWidth && !isMultiLine)
                {
                    sheet.Cells[x, y].Value = field.Text;
                }
                else
                {
                    // если текст длиннее, чем одна строка, то дробим его на слова по пробелам и увеличиваем количество строк,
                    // до тех пор, пока не впихнём все слова

                    // считаем сколько клеток смержено
                    int mergeCount = 0;
                    while (sheet.Cells[x, y + 1 + mergeCount].Merge)
                    {
                        mergeCount++;
                    }
                    if (isMultiLine)
                    {
                        // выделяем отдельно \n
                        field.Text = field.Text.Replace("\n", " \n ");
                    }
                    List<string> partOfText = field.Text.Split(" ").ToList();
                    string nowText = partOfText[0];
                    int j = 1;
                    while (j < partOfText.Count)
                    {
                        bool isNeedEnter = isMultiLine && partOfText[j] == "\n";
                        // высчитываем ширину без знака переноса строки, чтобы ширина вычислялась для текста в одну линию
                        double widthOfNextText = CalculateTextWidth(nowText + " " + partOfText[j].Replace("\n", string.Empty), sheet.Cells[x, y].Style.Font) + widthOfSubPart;
                        // если текст+следующее слово уже не помещаются в строку
                        // или если ныне веделенный текст имеет \n в себе
                        if (widthOfNextText > maxFieldsWidth || isNeedEnter)
                        {
                            // дополнительная часть влияет только на первую строку
                            widthOfSubPart = 0;

                            sheet.InsertRow(x, y);
                            sheet.Cells[x, y, x, y + mergeCount].Merge = true;
                            sheet.Cells[x, y].Value = nowText;
                            sheet.Cells[x, y].Style.Font.Italic = sheet.Cells[x + 1, y].Style.Font.Italic;
                            for (int k = 0; k <= mergeCount; k++)
                            {
                                sheet.Cells[x, y + k].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                            }

                            if (isNeedEnter)
                            {
                                // добавляем j, ибо он указывает на \n
                                j++;
                            }
                            // если \n был последним словом, то создаём ещё одну строку, пустую
                            if (j == partOfText.Count)
                            {
                                nowText = "";
                            }
                            else
                            {
                                nowText = partOfText[j];
                            }
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
            var size = graphics!.MeasureString(text, drawingFont);

            return Convert.ToDouble(size.Width) / excelWidthMult;
        }
    }
}
