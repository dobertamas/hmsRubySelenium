#require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
require './pages/login_page'
require './pages/page_factory'
=begin
Ruby does not automatically include the current directory in the list of directories
it will search for a require so you should explicitly prepend a ./
if you want to require a file in the current directory
=end

class LoginTests < Test::Unit::TestCase

  def setup
    @selenium_driver = Selenium::WebDriver.for :firefox
    @base_url = 'http://localhost:8084/console'
  end

  def test_happy_path_login
    page_factory_object = PageFactory.new
    login_page = page_factory_object.get_page_object('login_page', @selenium_driver, @base_url)
    assert_equal(login_page.login, 'HMS: Welcome', 'failed login')
  end

end

