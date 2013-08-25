require 'selenium-webdriver'
require '../object/test_object.rb'
#require File.expand_path('../test_object.rb', __FILE__)

driver = Selenium::WebDriver.for :firefox

index = IndexPage.new "http://wap.99wuxian.com", driver
index.open
index.toLoginPage
loginpage = LoginPage.new index.currentUrl, driver

loginpage.setUserName("test")
loginpage.setPassWord("test1234")
loginpage.setVaildText("8888")
loginpage.login
