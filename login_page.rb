require './base_page'

class LoginPage < BasePage

  def initialize(selenium_driver, base_url="http://localhost:8084/console/login")
    super(selenium_driver, base_url)
    @selenium_driver = selenium_driver
    @base_url=base_url
    if selenium_driver.nil?
      puts "There is no object!"
    else
      puts "We are good!"
      start
    end
  end

  def start
    @url = "/config/list"
    open(@url)
  end

  def open(url)
    @url = @base_url + @url
    @selenium_driver.get(@url)
  end

  def login(username="admin", password="admin")
    enter_username(@username)
    self.enterPassword(@password)
    clickLoginButton()
=begin
    if 'HMS: Global Prefs'
      in self.driver.title :
          self.log.debug("Successful login ")
      return True
      else :
          self.log.debug("Login failed ")
      return False
=end

  end


  def enter_username(username)
    sendKeys(@username, LoginPageLocators.USERNAME_FIELD, "name")

  end
end

@browser = Selenium::WebDriver.for :firefox
@url = "http://localhost:8084/console/login"
loginObject = LoginPage.new(@browser, @url)

