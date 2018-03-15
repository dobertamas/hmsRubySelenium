require './base_page'
require './locators'

class LoginPage < BasePage

  def start
    url = '/config/list'
    @url = @base_url + url
    @selenium_driver.get(@url)
  end

  def login(username="admin", password="admin")
    @username=username
    @password=password
    enter_username(@username)
    enter_password(@password)
    click_login_button()
  end

  def enter_username(username)
    @selenium_driver
    sendKeys(@username, LoginPageLocators::USERNAME_FIELD, "name")
  end

  def enter_password(password)
    @selenium_driver
    sendKeys(@password, LoginPageLocators::PASSWORD_FIELD, "name")
  end

  def click_login_button()
    element_click(LoginPageLocators::LOGIN_BUTTON, "name")
  end

  def sendKeys(data, locator, locatorType="name")
    super
  end

  def element_click(locator, locatorType="name")
    super
  end

end


