Feature: Journalist can create articles

    As a journalist
    In order write articles
    I would like to be able to create an article

    Background: 
        Given the following users exist
            | email          | password | role       |
            | jocke@craft.se | password | journalist |
            | alecia@craft.se| password | visitor    |
        And I am logged in as "jocke@craft.se"

    Scenario: Journalist can create article
        When I visit the journalist page
        And I fill in "Title" with "Vikings living amongst us"
        And I fill in "Lead" with "Hurra"
        And I fill in "Content" with "Vad kul"
        And I click "Save Article"
        Then I should see "Article was successfully created."

    Scenario: Journalist can't create article [Sad path]
        When I visit the journalist page
        And I fill in "Title" with "Vikings living amongst us"
        And I fill in "Lead" with "Hurra"
        And I click "Save Article"      
        # Then I should not see "Article was successfully created."

    Scenario: Visitor can't create article [Sad path]
        Given I am logged in as "alecia@craft.se"
        And I visit the journalist page
        Then I should see "Permission denied"
        And I should be on the "root_path" page