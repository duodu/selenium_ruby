#encoding:utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :firefox
dr_etf = Selenium::WebDriver.for :firefox
dr.get 'http://www.sse.com.cn/disclosure/diclosure/etf/'

links = dr.find_elements(:xpath, '//DIV[@id="marketinfoList"]/UL/LI/A')
puts links.count
links.each do |link|
  puts "#{link.text} : #{link[:href]}"
  dr_etf.get "#{link[:href]}"
  preCashComponent = dr_etf.find_element(:id, 'preCashComponent')
  navpercu = dr_etf.find_element(:id, 'navpercu')
  nav = dr_etf.find_element(:id, 'nav')
  puts "现金差额(单位:元) : #{preCashComponent.text}"
  puts "最小申购、赎回单位净值(单位:元) : #{navpercu.text}"
  puts "基金份额净值(单位:元) : #{nav.text}"
  puts "=============================================================="
end
