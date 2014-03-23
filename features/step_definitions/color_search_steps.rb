When(/^I search for ([^"]*)$/) do |hex_code|
  frankly_map( "textField placeholder:'#abcabc'", "setText:", hex_code )
  step 'I touch "Search"'
end