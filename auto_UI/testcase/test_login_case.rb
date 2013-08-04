#encoding:utf-8
require 'roo'
require '../test/test_login.rb'

excel = Roo::Excelx.new("../data/test_login.xlsx")
excel.default_sheet = excel.sheets.first
end_row_line = excel.last_row
puts end_row_line
# excel.set('E', 2, 'pass')

for line in 2 .. end_row_line
  testid = excel.cell('A', line).to_i
  username = excel.cell('B', line).to_s
  password = excel.cell('C', line).to_s
  expected = excel.cell('D', line).to_s
  test = TestLogin.new username, password, expected
  test.execute_test
end
