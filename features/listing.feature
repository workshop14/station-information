Feature: Listing all stations
  Background: 
    Given there is a station

  Scenario: Listing all stations
    When I visit the "stations" page
    Then I should see the station