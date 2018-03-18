require 'selenium-webdriver'
require 'logger'
require './utilities/my_log'

class BasePage

  def initialize(selenium_driver, base_url='http://localhost:8084/console')
    @selenium_driver = selenium_driver
    @base_url=base_url
    if selenium_driver.nil?
      puts 'There is no object!'
    else
      MyLog.log.debug 'in initialize method'
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
    MyLog.log.debug 'getting the element'
    element = get_element(locator_type, locator)
    element.send_keys(data)
  end

  def get_element(locator_type, locator)
    MyLog.log.debug 'inside the getElement method'
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
    MyLog.log.debug 'inside the element_click method'
    button.click
  rescue => e
    MyLog.log.debug "Exception Class: #{ e.class.name }"
    MyLog.log.debug "Exception Message: #{ e.message }"
    MyLog.log.debug "Exception Backtrace: #{ e.backtrace }"
  end

end
