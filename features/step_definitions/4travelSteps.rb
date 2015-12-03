

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
      when 'First Passenger Name'
        fill_in 'passFirst0',  with: value
      when 'Second Passenger Name'
        fill_in 'passFirst1',  with: value
      when 'First Passenger Last Name'
        fill_in 'passLast0',  with: value
      when 'Second Passenger Last Name'
        fill_in 'passLast1',  with: value
      when 'First Passenger Meal'
        select(value, :from => 'pass.0.meal')
      when 'Second Passenger Meal'
        select(value, :from => 'pass.1.meal')
      when 'Credit Card'
        select(value, :from => 'creditCard')
      when 'Credit Card Owner First Name'
        fill_in 'cc_frst_name',  with: value
      when 'Credit Card Owner Middle Name '
        fill_in 'cc_mid_name',  with: value
      when 'Credit Card Owner Last Name'
        fill_in 'cc_last_name',  with: value
      when 'Credit Card Number'
        fill_in 'creditnumber',  with: value
      when 'Credit Card expiration date month'
        select(value, :from => 'cc_exp_dt_mn')
      when 'Credit Card expiration date year'
        select(value, :from => 'cc_exp_dt_yr')
      when 'Billing Address'
        fill_in 'billAddress1',  with: value
      when 'Billing City'
        fill_in 'billCity',  with: value
      when 'Billing State'
        fill_in 'billState',  with: value
      when 'Billing Zip Code'
        fill_in 'billZip',  with: value
      when 'Billing Country'
        select(value, :from => 'billCountry')
      when 'Delivery Address'
        fill_in 'delAddress1',  with: value
      when 'Delivery City'
        fill_in 'delCity',  with: value
      when 'Delivery State'
        fill_in 'delState',  with: value
      when 'Delivery Zip Code'
        fill_in 'delZip',  with: value
      when 'Delivery Country'
        select(value, :from => 'delCountry')
        wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
        alert = wait.until { page.driver.browser.switch_to.alert }
        alert.accept
    end
  end

end