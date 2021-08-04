Feature: Get response from services

  Background:
    * url 'https://reqres.in/'

  Scenario: Get user
    Given path '/api/users/2'
    When method GET
    Then status 200

  Scenario: Get list user
    Given path '/api/users?page=2'
    When method GET
    Then status 200

  Scenario: Get user not found
    Given path '/api/users/23'
    When method GET
    Then status 404

  Scenario: Get list resources
    Given path '/api/unknown'
    When method GET
    Then status 200
    And match each $.[*].first_name == 'Michael'

  Scenario: Create succesfully
    Given path '/api/users'
    And  request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
