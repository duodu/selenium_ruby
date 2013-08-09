require './data_driver.rb'

test_login_excel = Excel_driver.new 'test_login.xlsx'
test_login_excel.open
end_row_line = test_login_excel.end_row
end_column_line = test_login_excel.end_column
id_array = test_login_excel.case_id_array

