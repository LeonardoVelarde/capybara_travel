Given(/^I am on the Guru(\d+) homepage$/) do |arg1|
  visit 'http://demo.guru99.com/'
end

When(/^I enter blank details for Register$/) do
	fill_in 'emailid', :with => ""
end


Then(/^error "([^"]*)" is show$/) do |arg1|
  puts "Email is required"
  page.has_content?(arg1)
  #page.driver.browser.manage.window.close
  
end

When(/^Press the "([^"]*)" button$/) do |arg1|
  click_button(arg1)
end


When(/^I enter "([^"]*)" for Register$/) do |arg1|
  fill_in 'emailid', :with => arg1
end

Then(/^I should see the following table:$/) do |table|
  data = table.rows_hash
  counter = 4
  path= find("table")
  xpath_base_name = './tbody/tr[%i]/td[1]'
  data.each_pair do |key, value|
     expect(path.find(:xpath, xpath_base_name % [counter])).to have_content(key)
     counter += 1 
  end
end
