require 'selenium-webdriver'


driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://www.soso.com"


new_icon = driver.find_element(:id => 's_input')
puts new_icon.tag_name
