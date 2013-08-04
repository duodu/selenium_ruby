require 'selenium-webdriver'
require '../object/test_object.rb'

class TestLogin
  def initialize username, password, expected
    @username = username
    @password = password
    @expected = expected
  end
  driver = Selenium::WebDriver.for :firefox
  
  index = IndexPage.new "http://wap.99wuxian.com", driver
  index.open
  index.toLoginPage
  loginpage = LoginPage.new index.currentUrl, driver
  
  loginpage.setUserName("test")
  loginpage.setPassWord("test1234")
  loginpage.setVaildText("8888")
  loginpage.login
end