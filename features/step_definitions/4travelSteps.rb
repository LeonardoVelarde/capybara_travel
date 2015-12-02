

When(/^i select a flight$/) do |table|
  data = table.rows_hash
  flight = ''
  data.each_pair do |key, value|
    if key == 'Airline'
      flight += value
    else
      flight += '$' + value
    end
  end
  find(:xpath, '//input[@value="'+flight+'"]').click
end

Then(/^i book a flight page is shown$/) do
  xpath_base = '/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[1]/td/img'
  find(:xpath, xpath_base)
end

Then(/^the selected flight is show$/) do |table|
  data = table.rows_hash
  data.each do |item|
    expect(page).to have_content(item[1])
  end
end

Then(/^confirmation for booked flight should be shown$/) do
  text = 'Your itinerary has been booked!'
  expect(page).to have_content(text)
  text = 'Frankfurt to New York'
  expect(page).to have_content(text)
  text = 'New York to Frankfurt'
  expect(page).to have_content(text)
end

When(/^form for both passengers is filled/) do |table|
  data = table.rows_hash
  data.each_pair do |key, value|
    case key
      when 'pass.0.meal'
        select(value, :from => key)
      when 'cc_exp_dt_mn'
        select(value, :from => key)
      when 'pass.1.meal'
        select(value, :from => key)
      when 'creditCard'
        select(value, :from => key)
      when 'cc_exp_dt_yr'
        select(value, :from => key)
      when 'billCountry'
        select(value, :from => key)
      when 'delCountry'
        select(value, :from => key)
        wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
        alert = wait.until { page.driver.browser.switch_to.alert }
        alert.accept
      else
        fill_in key, :with => value
    end
  end
end