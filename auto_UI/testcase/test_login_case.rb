#encoding:utf-8
require 'win32ole'
require 'pathname'
require '../test/test_login.rb'

path = Pathname.new(File.dirname(__FILE__)).realpath
WIN32OLE.codepage = WIN32OLE::CP_UTF8
excel = WIN32OLE::new('excel.Application')
workbook = excel.Workbooks.Open("#{path}/data/test_login.xlsx")
worksheet = workbook.Worksheets(1)
worksheet.Select
end_row_line = worksheet.UsedRange.rows.Count

begin
  for line in 2 .. end_row_line
    begin
      testid = worksheet.Range("A#{line}").value.to_i
      username = worksheet.Range("B#{line}").value.to_s
      password = worksheet.Range("C#{line}").value.to_s
      expected = worksheet.Range("D#{line}").value.to_s
      test = TestLogin.new username, password, [expected]
      report = test.assert
      worksheet.Range("A#{line}:F#{line}").Interior.ColorIndex = 3 if report[:result] == 'Fail'
      worksheet.Range("A#{line}:F#{line}").Interior.ColorIndex = 50 if report[:result] == 'Pass'
      test.screenshot("#{path}/screenshot/testlogin_error_id#{testid}.png") if report[:result] == 'Fail'
      worksheet.Range("E#{line}").value = report[:actual]
      worksheet.Range("F#{line}").value = report[:result]
    ensure
      workbook.save
      test.quit
    end
  end
ensure
  workbook.close
  excel.quit
end