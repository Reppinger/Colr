Feature: Add a tag to a color
  So that others know about the usage of the color
  As a user who applied a given color
  I want to add a tag to the color

  Background:
    Given I launch the app

# Test works, but colr.org API has no delete so I am making a mess adding tags with each test run
  Scenario: Tag is added to color
  Given I have found color ff00bb
  #When I add a_tag
  Then I see a_tag is added to the list of tags
