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
    self.enterPassword(@password)
    clickLoginButton()

  end

  def enter_username(username)
    @selenium_driver
    sendKeys(@username, LoginPageLocators::USERNAME_FIELD, "name")
  end

  def sendKeys(data, locator, locatorType="name")
    super
  end

end


