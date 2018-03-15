require "selenium-webdriver"

class BasePage

  def initialize(selenium_driver, base_url="http://localhost:8084/console/login")
    @selenium_driver = selenium_driver
    @base_url=base_url
    @element
    if selenium_driver.nil?
      puts "There is no object!"
    else
      puts "We are in initialize method"
      start
    end
  end

  def start
    puts "inside start method"
    @selenium_driver.get @base_url
  end

  def open(url)
    @url = @base_url + url
    @selenium_driver.get(@url)
  end

  def sendKeys(data, locator, locatorType="name")
    @locator=locator
    @locatorType=locatorType
    @data=data
    puts "getting the element"
    @element = getElement(@locator, @locatorType)
    @element.send_keys(@data)
  end

  def getElement(locator, locatorType)
    @locator=locator
    @locatorType=locatorType
    puts "inside the getElement method"
    @element = @selenium_driver.find_element(@locatorType, @locator)
  rescue => e
    puts "Got an exception"
    @error_message="#{$!}"
    puts "Exception Class: #{ e.class.name }"
    puts "Exception Message: #{ e.message }"
    puts "Exception Backtrace: #{ e.backtrace }"
  return @element
end

def element_click(locator, locatorType)
  @locator=locator
  @locatorType=locatorType
  button = @selenium_driver.find_element(@locatorType, @locator)
  sleep(3)
  button.click()
rescue => e
  puts "Got an exception"
  @error_message="#{$!}"
  puts "Exception Class: #{ e.class.name }"
  puts "Exception Message: #{ e.message }"
  puts "Exception Backtrace: #{ e.backtrace }"

end

end
