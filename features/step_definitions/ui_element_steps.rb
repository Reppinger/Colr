Then(/^I see the color search textfield$/) do
  check_element_exists "view:'UITextFieldCenteredLabel' marked:'#abcabc'"
end
Then(/^I see the search button$/) do
  check_element_exists "view:'UIButtonLabel' marked:'Search'"
end