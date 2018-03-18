require_relative './base_page'
require_relative './locators'
require './utilities/my_log'
require './utilities/file_reader'
require 'test/unit'

class LoginPage < BasePage

  def start
    url = '/welcome'
    @url = @base_url + url
    @selenium_driver.get(@url)
  end

  def login
    my_reader=FileReader.new

    my_username=my_reader.get_username
    MyLog.log.debug 'username from file was: '+ my_username
    enter_username(my_username)

    my_password=my_reader.get_password
    MyLog.log.debug 'password from file was: '+ my_password
    enter_password(my_password)

    click_login_button

    @selenium_driver.title
  end

  def enter_username(username)
    MyLog.log.debug 'sending username'
    send_keys('name', LoginPageLocators::USERNAME_FIELD, username)
  end

  def enter_password(password)
    MyLog.log.debug 'sending password'
    send_keys('name', LoginPageLocators::PASSWORD_FIELD, password)
  end

  def click_login_button
    MyLog.log.debug 'clicking'
    element_click('name', LoginPageLocators::LOGIN_BUTTON)
  end

end


