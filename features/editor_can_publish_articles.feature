Feature: Editor can publish articles

    As an editor,
    In order to make sure that the articles have good standards
    I would like only editors to be able to publish articles.

    Background:
        Given the following articles exist
            |  title                            |  lead                      |  content                                           | approved |  
            |  Voted best mead recipe           |  Restaurant wins prize     |  Restaurant wins prize for best mead in Sweden     | false    |

        Given the following users exist
            | email           | password | role       |
            | perper@craft.se | password | editor     |
            | jocke@craft.se  | password | journalist |
            | alecia@craft.se | password | visitor    |
        And I am logged in as "perper@craft.se"

    Scenario: Editor can publish articles
        Given I visit the editor page
        Then I should see "Voted best mead recipe"
        And I click "Voted best mead recipe"
        And I click "Edit"
        And I click "Publish"
        
