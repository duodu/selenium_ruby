#encoding:utf-8
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.get "http://wap.99wuxian.com"
sleep 3
links = driver.find_elements(:tag_name, 'a' )
i = 0
links.each do |link|
  puts i
  puts link.text
  i += 1
end
puts links.count
links[9].click

username = driver.find_element(:id, 'userName' )
password = driver.find_element(:id, 'password' )
validnum = driver.find_element(:name, 'jcaptcha')
subbtn = driver.find_element(:name, 'log')
username.send_keys('zerolin')
password.send_keys('zerolin')
validnum.send_keys('8888')
subbtn.click
driver.save_screenshot 'E:\test.png'

# element = driver.find_element( :text => "登录" )
# element.click