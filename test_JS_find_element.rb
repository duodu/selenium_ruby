require 'rubygems'
require 'selenium-webdriver'
require 'pp'
 
Selenium::WebDriver::Element.module_eval do
    def highlight
        e_id = self.attribute('id')
        puts "#{e_id} = e_id"
        js = <<JS 
        document.getElementById("#{e_id}").style.border = "3px solid red"
JS
        @bridge.executeScript(js) if e_id
    end
end
 
url = %q{http://www.soso.com/}
 
dr = Selenium::WebDriver.for :firefox
dr.navigate.to url
sleep 1
 
s_input = dr.find_element(:id => 's_input')
# 或者使用语法糖衣
# s_input = dr['s_input']
s_input.highlight