#require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
require './pages/login_page'
=begin
Ruby does not automatically include the current directory in the list of directories
it will search for a require so you should explicitly prepend a ./
if you want to require a file in the current directory
=end

class LoginTests < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
    @url = 'http://localhost:8084/console'
  end

  def test_happy_path_login
    login_object = LoginPage.new(@browser, @url)
    login_object.login('admin', 'admin')
  end

end

