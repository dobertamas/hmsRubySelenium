require "selenium-webdriver"

class BasePage

  def initialize(selenium_driver, base_url="http://localhost:8084/console/login")
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
    puts "started page"
    @selenium_driver.get @base_url
  end

  def open(url)
    @url = @base_url + url
    @selenium_driver.get(@url)
  end

end

browser = Selenium::WebDriver.for :firefox
basePage = BasePage.new(browser, "http://localhost:8084/console/login")
#basePage.open('/config/list')
