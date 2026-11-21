Feature: The product store service back-end
    As a Product Store Owner
    I need a RESTful catalog service
    So that I can keep track of all my products

Background:
    Given the following products
        | name    | description         | price  | available | category   |
        | Hat     | A red fedora        | 59.95  | True      | CLOTHS     |
        | Shoes   | Blue running shoes  | 120.00 | False     | CLOTHS     |
        | Big Mac | Double beef burger  | 5.99   | True      | FOOD       |
        | Sheets  | Cotton bed sheets   | 35.50  | False     | HOUSEWARES |

Scenario: Read a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    And I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "Success"
    And I should see "Hat" in the "Name" field
    And I should see "A red fedora" in the "Description" field
    And I should see "59.95" in the "Price" field
    And I should see "True" in the "Available" dropdown
    And I should see "CLOTHS" in the "Category" dropdown

Scenario: Update a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the "Name" field
    When I change "Description" to "A stylish red fedora"
    And I press the "Update" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    And I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "Success"
    And I should see "A stylish red fedora" in the "Description" field

Scenario: Delete a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    And I paste the "Id" field
    And I press the "Delete" button
    Then I should see the message "Product has been Deleted!"
    When I press the "Clear" button
    And I press the "Search" button
    Then I should see the message "Success"
    And I should not see "Hat" in the "results"

Scenario: List all Products
    When I visit the "Home Page"
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the "results"
    And I should see "Shoes" in the "results"
    And I should see "Big Mac" in the "results"
    And I should see "Sheets" in the "results"

Scenario: Search for Products by Category
    When I visit the "Home Page"
    And I select "CLOTHS" in the "Category" dropdown
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the "results"
    And I should see "Shoes" in the "results"
    And I should not see "Big Mac" in the "results"
    And I should not see "Sheets" in the "results"

Scenario: Search for Products by Availability
    When I visit the "Home Page"
    And I select "True" in the "Available" dropdown
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the "results"
    And I should see "Big Mac" in the "results"
    And I should not see "Shoes" in the "results"
    And I should not see "Sheets" in the "results"
    When I press the "Clear" button
    And I select "False" in the "Available" dropdown
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Shoes" in the "results"
    And I should see "Sheets" in the "results"
    And I should not see "Hat" in the "results"
    And I should not see "Big Mac" in the "results"

Scenario: Search for Products by Name
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the "results"
    And I should not see "Shoes" in the "results"
    And I should not see "Big Mac" in the "results"
    And I should not see "Sheets" in the "results"
