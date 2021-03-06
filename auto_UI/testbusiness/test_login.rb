#encoding:utf-8
require 'selenium-webdriver'
require '../object/test_object.rb'
require '../config/config.rb'

class ValidTest
  def assert expected, actual
    if expected === actual
      result = 'Pass'
    else
      result = 'Fail'
    end
    report = Hash.new
    report[:actual] = actual
    report[:result] = result
    return report
  end
end
class TestLogin < ValidTest
  def initialize username, password, expected=[]
    @username = username
    @password = password
    @expected = expected
  end
  def execute_test
    @driver = Selenium::WebDriver.for :firefox
    index = IndexPage.new $url, @driver
    index.open
    index.toLoginPage
    loginpage = LoginPage.new index.currentUrl, @driver
    loginpage.setUserName(@username)
    loginpage.setPassWord(@password)
    loginpage.setVaildText("8888")
    loginpage.login
    actual = Array.new
    actual << loginpage.text_result
    return actual
  end
  def assert
    actual = execute_test
    super(@expected, actual)
  end
  def screenshot filename
    @driver.save_screenshot filename
  end
  def quit
    @driver.quit
  end
end