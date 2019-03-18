Feature: Journalist can edit and delete articles

    As a Journalist,
    In order to change articles I have already written
    I would like to be able to edit and delete articles
    
    
    Background: 
        Given the following articles exist
            |  title                            |  lead                      |  content                                           |  
            |  Voted best mead recipe           |  Restaurant wins prize     |  Restaurant wins prize for best mead in Sweden     |
            |  Ancient viking grave discovered  |  Kids came across sword    |  Kids come across sword protruding from the earth  |
        Given the following users exist
            | email          | password | role       |
            | jocke@craft.se | password | journalist |
        And I am logged in as "jocke@craft.se"

    Scenario: Journalist can edit articles
        Given I visit the journalist page
        Then I should see "Voted best mead recipe"
        And I should see "Ancient viking grave discovered"
        And I click "Voted best mead recipe"
        And I click "Edit"
        And I fill in "Title" with "Voted worst mead recipe"
        And I click "Update Article"
        And I click "Back"
        Then I should see "Voted worst mead recipe"
        
        @javascript
    Scenario: Journalist can delete articles
        Given I visit the journalist page
        Then I should see "Voted best mead recipe"
        And I click "Voted best mead recipe"
        And I click "Edit"
        And I click "Delete"
        And I click the popup
        And I should be on the "/articles/new" page
        Then I should not see "Voted best mead recipe"