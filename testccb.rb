#encoding:utf-8
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox

driver.get "http://ccb.99wuxian.com/"
links = driver.find_elements(:tag_name, 'a')
driver.find_element(:class, 'nopage-btn').click if links.count == 1
links = driver.find_elements(:tag_name, 'a')
links[9].click
