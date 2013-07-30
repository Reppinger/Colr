Then(/^I see the color search textfield$/) do
  check_element_exists "view:'UITextFieldCenteredLabel' marked:'#abcabc'"
end
Then(/^I see the search button$/) do
  check_element_exists "view:'UIButtonLabel' marked:'Search'"
end
When(/^I add ([^"]*)$/) do |tag|
  frankly_map( "textField placeholder:'tag'", "setText:", tag )
  step 'I touch "Add"'
end
Then(/^I see ([^"]*) is added to the list of tags$/) do |tag|
  check_element_exists "view:'UILabel' marked:'#{tag}'"
end