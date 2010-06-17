Feature: Exception2db index page
  In order to view captured exceptions
  As an authenticated user
  I want to see exceptions list

  Scenario: Not Authorized
    Given an exception2db exists
    Given I have not been granted read access
    When I go to the list of exception2dbs
    Then I should see "Not Authorized" within "h2"

  Scenario: Exception2db List
    Given an exception2db exists
    Given I have been granted read access
    When I go to the list of exception2dbs
    Then I should see "RuntimeError: 46" within "#container h2 a"
    Then I should see a link with text "Powered by exception2db" within "#footer" with url "http://github.com/neerajdotname/exception2db"
    Then I should see a link with text "Report bug" within "#footer" with url "http://github.com/neerajdotname/exception2db/issues"

  Scenario: Clicking on a record
    Given an exception2db exists
    Given I have been granted read access
    When I go to the list of exception2dbs
    When I follow "RuntimeError: 46" within "#container h2"
    Then I should be on exception2db show page with last exception2db
    Then I should see "[PROJECT_ROOT]/vendor/plugins/exception2db/app/controllers/exception2db/main_controller.rb:10"


