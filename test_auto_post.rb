#encoding:utf-8
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox

driver.get "http://tieba.baidu.com/f?kw=%BD%A3%C1%E9&fr=ala0"

# tiezi = driver.find_elements(:class, 'j_th_tit')
# puts tiezi.count
# tiezi.each do |t|
  # puts t.text
# end
driver.find_element(:class, 'u_login').find_element(:tag_name, 'a').click
driver.find_element(:name, 'userName').send_keys('小无敌的人')
driver.find_element(:name, 'password').send_keys('zerolin')
driver.find_element(:id, 'TANGRAM__PSP_11__submit').submit
sleep(5)
tiezi = driver.find_elements(:class =>'j_th_tit', :tag_name => 'a')
puts tiezi.count
tiezi.each do |t|
  puts "#{t.text} : #{t['href']}"
end