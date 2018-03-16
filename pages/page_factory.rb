require_relative '../pages/login_page'
require_relative './main_page'

class PageFactory
=begin
  Returns the appropriate page object based on the name of the page
=end

  def get_page_object(page_name, selenium_driver, base_url='http://localhost:8084/console')
    @test_page_object
    if page_name == 'login_page'
      @test_page_object = LoginPage.new(selenium_driver, base_url)
    elsif page_name == 'main_page'
      @test_page_object = MainPage.new(selenium_driver, base_url)
    else
    end

  end

end
