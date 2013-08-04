require 'selenium-webdriver'

class Browser
  def initialize driver
    @driver = driver
  end
end
class BasePage < Browser
  def initialize url, driver
    super driver
    @url = url
  end
  def open
    @driver.get @url
  end
  def close
    @driver.quit
  end
  def currentUrl
    @driver.current_url
  end
end

class IndexPage < BasePage
  def links
    @link_LoginPage = @driver.find_element(:xpath, "/HTML/BODY/DIV[2]/TABLE/TBODY/TR/TD[1]/A[2]")
    @link_RegPage = @driver.find_element(:xpath, "/HTML/BODY/DIV[2]/TABLE/TBODY/TR/TD[1]/A[3]")
  end
  def toLoginPage
    links
    @link_LoginPage.click
  end
  def toRegPage
    links
    @link_RegPage.click
  end
  
end
class LoginPage < BasePage
  def links
    @btn_login = @driver.find_element(:name, "log")
    @link_IndexPage = @driver.find_element(:xpath, "/HTML/BODY/DIV[2]/TABLE/TBODY/TR/TD[1]/A[1]")
  end
  def forms
    @text_username = @driver.find_element(:id, "userName")
    @text_password = @driver.find_element(:id, "password")
    @text_valid = @driver.find_element(:name, "jcaptcha")
  end
  def text_result
    # result = Array.new
    @text_hot = @driver.find_element(:class, "hot").text
    result = @text_hot
    return result
  end
  def setUserName(username)
    forms
    @text_username.send_keys(username)
  end
  def setPassWord(password)
    forms
    @text_password.send_keys(password)
  end
  def setVaildText(validtext)
    forms
    @text_valid.send_keys(validtext)
  end
  def login
    links
    @btn_login.click
  end
  def toIndexPage
    links
    @link_IndexPage.click
  end
end

