require 'selenium-webdriver'

class BasePage

  def initialize(selenium_driver, base_url='http://localhost:8084/console')
    @selenium_driver = selenium_driver
    @base_url=base_url
    if selenium_driver.nil?
      puts 'There is no object!'
    else
      puts 'We are in initialize method'
      start
    end
  end

  def start
    puts 'inside start method'
    @selenium_driver.get @base_url
  end

  def open(url)
    @url = @base_url + url
    @selenium_driver.get(@url)
  end

  def send_keys(locator_type='name', locator, data)
    puts 'getting the element'
    element = get_element(locator_type, locator)
    element.send_keys(data)
  end

  def get_element(locator_type, locator)
    puts 'inside the getElement method'
    element = @selenium_driver.find_element(locator_type, locator)
  rescue => e
    #error_message="#{$!}"
    puts "Exception Class: #{ e.class.name }"
    puts "Exception Message: #{ e.message }"
    puts "Exception Backtrace: #{ e.backtrace }"
    return element
  end

  def element_click(locator_type, locator)
    button = @selenium_driver.find_element(locator_type, locator)
    sleep(3)
    button.click
  rescue => e
    puts "Exception Class: #{ e.class.name }"
    puts "Exception Message: #{ e.message }"
    puts "Exception Backtrace: #{ e.backtrace }"
  end

end
