Given(/^I click the "([^"]*)" link$/) do |linkText|
  click_link(linkText)
end

Given(/^the Mercury Tours homepage$/) do
	page.driver.browser.manage.window.maximize
	visit ('http://newtours.demoaut.com/')
end

Given(/^i enter my username and password$/) do
	fill_in 'userName', :with => ENV['USER']
	fill_in 'password', :with => ENV['PSW']
end

Given(/^Mercury sing on page$/) do
	page.driver.browser.manage.window.maximize
	visit ('http://newtours.demoaut.com/mercurysignon.php')
end

When(/^I enter the required fields as show below$/) do |table|
  data = table.rows_hash
  data.each_pair do |key, value|
    case key
	when "First Name:"
    	fill_in 'firstName', :with => value
    	@name = value
	when "Last Name:"
		fill_in 'lastName', :with => value
		@lastName = value
    when "Phone:"
		fill_in 'phone', :with => value
    when "Email:"
		fill_in 'userName', :with => value
	when "Address:"
		fill_in 'address1', :with => value
	when "City:"
		fill_in 'city', :with => value
	when "State/Province:"
		fill_in 'state', :with => value
	when "Postal Code:"
		fill_in 'postalCode', :with => value
	when "Country:"
		select(value, :from => 'country')
	when "User Name:"
		fill_in 'email', :with => value
		@userName = value
	when "Password:"
		fill_in 'password', :with => value
	when "Confirm Password:"
		fill_in 'confirmPassword', :with => value
	end
  end
end

When(/^send my registration form$/) do
  xpath_base = '/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table/tbody/tr[18]/td/input'
  find(:xpath, xpath_base).click
end

Then(/^the confirmation screen is show$/) do
  greeting = "Dear"+" "+@name+" "+@lastName 	
  #page.should have_content()
  expect(page).to have_content(greeting)
  
end

Then(/^my user name is "([^"]*)"$/) do |userName|
  text= " Note: Your user name is "+userName+"."
  expect(page).to have_content(text)
end

When(/^i press the "([^"]*)" button$/) do |sing_in|
	find(:xpath, '//input[@name="' + sing_in + '"]').click
end

Then(/^the Flight Finder screen is show$/) do
	# test with more than one text base
  xpath_base = '/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table/tbody/tr[1]/td/font/font/b/font/font'
	find(:xpath, xpath_base)
end



