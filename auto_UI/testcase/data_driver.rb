#encoding:utf-8
require 'win32ole'
require 'pathname'
require '../test/test_login.rb'

class Excel_driver
  def initialize filename
    path = Pathname.new(File.dirname(__FILE__)).realpath
    @path = "#{path}/data/#{filename}"
  end
  def open
    WIN32OLE.codepage = WIN32OLE::CP_UTF8
    @excel = WIN32OLE::new('excel.Application')
    @workbook = @excel.Workbooks.Open(@path)
  end
  def sheetselect num
    @worksheet = workbook.Worksheets(num)
    @worksheet.Select
  end
  def end_row
    return @worksheet.UsedRange.rows.Count
  end
  def end_column
    return @worksheet.UsedRange.column.Count
  end
  def cell column, row
    return @worksheet.Range("#{column}#{row}").value
  end
  def setColor row, result
    endcolumn = end_column
    @worksheet.Range("A#{row}:#{endcolumn}#{row}").Interior.ColorIndex = 3 if result == 'Fail'
    @worksheet.Range("A#{row}:#{endcolumn}#{row}").Interior.ColorIndex = 50 if result == 'Pass'
  end
  def save
    @workbook.save
  end
  def quit
    @workbook.close
    @excel.quit
  end
  # def read cell
    # return @worksheet.Range(cell).value
    # # endcolumn = end_column
    # # for column in 1 .. endcolumn
      # # param = @worksheet.Range("#{column}1").value
      # # if param.to_s.include?("param")
        # # Kernel.send Array, param
      # # end
    # # end
  # end
  def write cell, value
    @wooksheet.Range(cell).value = value
  end
  def case_id_array
    id_array = Array.new
    for line in 1 .. end_row
      id_array << @worksheet.Range("A#{line}").value.to_i
    end
    return id_array
  end
end
# path = Pathname.new(File.dirname(__FILE__)).realpath
# WIN32OLE.codepage = WIN32OLE::CP_UTF8
# excel = WIN32OLE::new('excel.Application')
# workbook = excel.Workbooks.Open("#{path}/data/test_login.xlsx")
# worksheet = workbook.Worksheets(1)
# worksheet.Select
# end_row_line = worksheet.UsedRange.rows.Count
# 
# begin
  # for line in 2 .. end_row_line
    # testid = worksheet.Range("A#{line}").value.to_i
    # username = worksheet.Range("B#{line}").value.to_s
    # password = worksheet.Range("C#{line}").value.to_s
    # expected = worksheet.Range("D#{line}").value.to_s
    # test = TestLogin.new username, password, [expected]
    # report = test.assert
    # worksheet.Range("A#{line}:F#{line}").Interior.ColorIndex = 3 if report[:result] == 'Fail'
    # worksheet.Range("A#{line}:F#{line}").Interior.ColorIndex = 50 if report[:result] == 'Pass'
    # worksheet.Range("E#{line}").value = report[:actual]
    # worksheet.Range("F#{line}").value = report[:result]
    # workbook.save
  # end
# ensure
  # workbook.close
  # excel.quit
# end