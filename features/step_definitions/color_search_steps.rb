Given(/^I have found color ([^"]*)$/) do |hex_code|
  step "I fill in \"#abcabc\" with \"#{hex_code}\""
  step "I touch \"Search\""
end