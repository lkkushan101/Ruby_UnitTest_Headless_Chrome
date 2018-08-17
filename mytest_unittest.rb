require 'test/unit'
require 'selenium-webdriver'

class MyTest < Test::Unit::TestCase
  def setup
  
    options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
    @driver = Selenium::WebDriver.for(:chrome, options: options) 
    @driver.manage.window.maximize
    @driver.navigate.to "https://www.google.lk"
  end
  
  def test_search
    #Typing the Selenium in Google search
    @driver.find_element(:id, "lst-ib").send_keys "Selenium"

    #Press Key Esc to avoid the list of results from the input box
    @driver.find_element(:id, "lst-ib").send_keys "\ue00C"

    #Clicking the search button
    @driver.find_element(:name, "btnK").click

    #Clicking the search button
    @driver.find_element(:link, "Selenium - Web Browser Automation").click

    #Asserting whether the registration success message is displayed
    puts @driver.title
  end

  def teardown
		@driver.quit
  end
end
