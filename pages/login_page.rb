require_relative './base_page'
require_relative './locators'
require './utilities/my_log'

class LoginPage < BasePage

  def start
    url = '/welcome'
    @url = @base_url + url
    @selenium_driver.get(@url)
  end

  def login(username='admin', password='admin')
    enter_username(username)
    enter_password(password)
    click_login_button
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


