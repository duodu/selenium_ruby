#encoding:utf-8
require 'selenium-webdriver'
require 'test/unit'
begin
  driver = Selenium::WebDriver.for :firefox
  driver.get "http://wap.99wuxian.com/"
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
  username.send_keys('order1')
  password.send_keys('hp123456')
  validnum.send_keys('8888')
  subbtn.click
  $expected = '验证码输入错误，请重新输入。'
  $result =  driver.find_element(:class, 'hot').text
  puts $result
  class Test_test < Test::Unit::TestCase
    def test1
      assert_match($expected, $result, "#{$result} and #{$expected} not match")
    end
  end
ensure
  driver.quit
end
#driver.save_screenshot 'E:\test.png'

# element = driver.find_element( :text => "登录" )
# element.click