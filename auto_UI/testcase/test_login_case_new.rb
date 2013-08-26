require 'pathname'
require '../testcase/data_driver.rb'
require '../testbusiness/test_login.rb'

class Test_Execute
  def initialize testcase
    @testcase = testcase
  end
  def execute
    path = Pathname.new(File.dirname(__FILE__)).realpath
    test_login_excel = Excel_driver.new @testcase
    test_login_excel.open
    test_login_excel.sheetselect 1
    end_row_line = test_login_excel.end_row
    end_column_line = test_login_excel.end_column
    id_array = test_login_excel.case_id_array
    begin
      id_array.each do |testid|
        begin
          row = testid + 1
          username = test_login_excel.cell('B', row)
          password = test_login_excel.cell('C', row)
          expected = test_login_excel.cell('D', row)
          test = TestLogin.new username, password, [expected]
          report = test.assert
          test_login_excel.setColor(row, report[:result])
          test.screenshot("#{path}/screenshot/testlogin_error_id#{testid}.png") if report[:result] == 'Fail'
          test_login_excel.write("E#{row}", report[:actual])
          test_login_excel.write("F#{row}", report[:result])
        ensure
          test_login_excel.save
          test.quit
        end      
      end
    ensure
      test_login_excel.quit
    end
  end
end

# mytestexecute = Test_Execute.new 'test_login.xlsx'
# mytestexecute.execute
