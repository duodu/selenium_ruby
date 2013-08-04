require 'selenium-webdriver'
require '../object/test_object.rb'

class TestLogin
  def initialize username, password, expected=[]
    @username = username
    @password = password
    @expected = expected
  end
  def execute_test
    begin
      driver = Selenium::WebDriver.for :firefox
      index = IndexPage.new "http://wap.99wuxian.com", driver
      index.open
      index.toLoginPage
      loginpage = LoginPage.new index.currentUrl, driver
      loginpage.setUserName(@username)
      loginpage.setPassWord(@password)
      loginpage.setVaildText("8888")
      loginpage.login
      actual = loginpage.text_result
      puts "#{@expected} #{@expected.class} #{@expected.length}"
      puts "#{actual} #{actual.class} #{actual.length}"
      if @expected == actual
        result = 'pass'
      else
        result = 'fail'
      end
      puts result
    ensure
      driver.quit
    end
  end
end