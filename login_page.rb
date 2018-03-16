require './base_page'
require './locators'

class LoginPage < BasePage

  def start
    url = '/welcome'
    @url = @base_url + url
    @selenium_driver.get(@url)
  end

  def login(username='admin', password='admin')
    @username=username
    @password=password
    enter_username(@username)
    enter_password(@password)
    click_login_button
  end

  def enter_username(username)
    send_keys('name', LoginPageLocators::USERNAME_FIELD, username)
  end

  def enter_password(password)
    send_keys('name', LoginPageLocators::PASSWORD_FIELD, password)
  end

  def click_login_button
    element_click('name', LoginPageLocators::LOGIN_BUTTON)
  end

  def send_keys(locator_type='name', locator, data)
    super
  end

  def element_click(locator_type='name', locator)
    super
  end

end


