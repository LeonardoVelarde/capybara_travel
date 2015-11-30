Given(/^I am on the Google homepage$/) do
  page.driver.browser.manage.window.maximize
  visit ('/')
end

When(/^I search for "([^"]*)"$/) do |valueToSearch|
  fill_in 'q', :with => valueToSearch
end

Then(/^I should see "([^"]*)" logo$/) do |arg1|
  find("label", :text => arg1)
end

Then(/^Then I will click the "([^"]*)" link$/) do |linkText|
  click_link(linkText)
end

Then(/^I will click the "([^"]*)" link$/) do |arg1|
  click_link(arg1)
end
