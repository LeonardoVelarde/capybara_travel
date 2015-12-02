

When(/^i fill fields of flight finder$/) do |table|
  data = table.rows_hash
  data.each_pair do |key, value|
    case key
      when 'tripType'
        find(:xpath, '//input[@value="' + value + '"]').click
      when 'servClass'
        find(:xpath, '//input[@value="' + value + '"]').click
      else
        select(value, :from => key)
    end
  end
end

Then(/^the select Flight page is shown with departure and return$/) do
  text = 'Select your departure and return flight from the selections below. Your total price will be higher than quoted if you elect to fly on a different airline for both legs of your travel.'
  expect(page).to have_content(text)
  expect(page).to have_content('DEPART')
  expect(page).to have_content('RETURN')
end

Then(/^the select Flight page is shown with only departure$/) do
  text = 'Select your departure and return flight from the selections below. Your total price will be higher than quoted if you elect to fly on a different airline for both legs of your travel.'
  expect(page).to have_content(text)
  expect(page).to have_content('DEPART')
  xpath_base = '/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table[2]/tbody/tr[1]/td/table/tbody/tr[1]/td[1]/font/b/font'
  a = find(:xpath, xpath_base)
  expect(a).to be(nil)
end
