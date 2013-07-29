Feature: Search for color by hex code
  So that I can find a color
  As a user
  I want to enter a hex code and see the color with its tags

  Background:
    Given I launch the app

  Scenario: Search screen is ready
    Then I should see a navigation bar titled "Search"
     And I see the color search textfield
     And I see the search button

